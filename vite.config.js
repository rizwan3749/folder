import { defineConfig, loadEnv } from "vite";
import react from "@vitejs/plugin-react";
import { VitePWA } from "vite-plugin-pwa";
import { writeFileSync } from "fs";
import { resolve } from "path";

// https://vitejs.dev/config/
export default defineConfig(({ mode }) => {
  const env = loadEnv(mode, process.cwd(), "");

  return {
    plugins: [
      react(),
      VitePWA({
        registerType: "autoUpdate",
        includeAssets: [
          "favicon.ico",
          "apple-touch-icon.png",
          "masked-icon.svg",
          "background-sw.js",
        ],
        manifest: {
          name: "Internal Chat App",
          short_name: "InternalChat",
          description: "Internal Chat Application - Connect with your team",
          theme_color: "#667eea",
          background_color: "#ffffff",
          display: "standalone",
          orientation: "portrait",
          scope: "/",
          start_url: "/",
          categories: ["social", "communication"],
          icons: [
            {
              src: "pwa-192x192.png",
              sizes: "192x192",
              type: "image/png",
            },
            {
              src: "pwa-512x512.png",
              sizes: "512x512",
              type: "image/png",
            },
            {
              src: "pwa-512x512.png",
              sizes: "512x512",
              type: "image/png",
              purpose: "any maskable",
            },
          ],
        },
        workbox: {
          globPatterns: ["**/*.{js,css,html,ico,png,svg}"],
          additionalManifestEntries: [
            {
              url: "/background-sw.js",
              revision: "1",
            },
          ],
          runtimeCaching: [
            {
              urlPattern: /^https:\/\/internalchat\.pizeonfly\.com\/.*/i,
              handler: "NetworkFirst",
              options: {
                cacheName: "api-cache",
                expiration: {
                  maxEntries: 100,
                  maxAgeSeconds: 60 * 60 * 24 * 7, // 7 days
                },
                cacheableResponse: {
                  statuses: [0, 200],
                },
              },
            },
            {
              urlPattern: /^\/api\/messages\/.*/i,
              handler: "NetworkFirst",
              options: {
                cacheName: "message-cache",
                expiration: {
                  maxEntries: 50,
                  maxAgeSeconds: 60 * 60 * 24, // 1 day
                },
                cacheableResponse: {
                  statuses: [0, 200],
                },
              },
            },
          ],
        },
      }),
      {
        name: "generate-firebase-sw-config",
        buildStart() {
          // Generate service worker config at build time
          const firebaseConfig = {
            apiKey: env.VITE_FIREBASE_API_KEY || "",
            authDomain: env.VITE_FIREBASE_AUTH_DOMAIN || "",
            projectId: env.VITE_FIREBASE_PROJECT_ID || "",
            storageBucket: env.VITE_FIREBASE_STORAGE_BUCKET || "",
            messagingSenderId: env.VITE_FIREBASE_MESSAGING_SENDER_ID || "",
            appId: env.VITE_FIREBASE_APP_ID || "",
          };

          const configContent = `// Auto-generated Firebase config - DO NOT EDIT MANUALLY
const FIREBASE_CONFIG = ${JSON.stringify(firebaseConfig, null, 2)};
`;

          writeFileSync(
            resolve(__dirname, "public/firebase-sw-config.js"),
            configContent
          );

          console.log("✅ Generated firebase-sw-config.js");
        },
      },
    ],
    base: "./", // Important for Electron
    server: {
      port: 3000,
      proxy: {
        "/api": {
          target: "https://internalchat.pizeonfly.com:5001/",
          // target: "http://localhost:5002/",
          changeOrigin: true,
        },
      },
    },
    build: {
      outDir: "dist",
      emptyOutDir: true,
      rollupOptions: {
        output: {
          manualChunks: undefined,
        },
      },
    },
  };
});
