#!/usr/bin/env node

/**
 * Setup Verification Script
 * Checks if everything is properly configured for desktop app
 */

import fs from "fs";
import path from "path";
import { fileURLToPath } from "url";

const __filename = fileURLToPath(import.meta.url);
const __dirname = path.dirname(__filename);

console.log("\n🔍 Verifying Desktop App Setup...\n");

let errors = 0;
let warnings = 0;

// Check 1: Node.js version
console.log("📦 Checking Node.js version...");
const nodeVersion = process.version;
const majorVersion = parseInt(nodeVersion.slice(1).split(".")[0]);
if (majorVersion >= 16) {
  console.log(`   ✅ Node.js ${nodeVersion} (Good!)`);
} else {
  console.log(`   ❌ Node.js ${nodeVersion} (Need 16+)`);
  errors++;
}

// Check 2: package.json exists
console.log("\n📄 Checking package.json...");
if (fs.existsSync("package.json")) {
  const pkg = JSON.parse(fs.readFileSync("package.json", "utf8"));
  console.log(`   ✅ Found package.json`);
  console.log(`   📌 App: ${pkg.name} v${pkg.version}`);

  // Check if Electron is in dependencies
  if (pkg.devDependencies && pkg.devDependencies.electron) {
    console.log(`   ✅ Electron ${pkg.devDependencies.electron}`);
  } else {
    console.log(`   ❌ Electron not found in devDependencies`);
    errors++;
  }

  // Check if electron-builder is in dependencies
  if (pkg.devDependencies && pkg.devDependencies["electron-builder"]) {
    console.log(
      `   ✅ electron-builder ${pkg.devDependencies["electron-builder"]}`
    );
  } else {
    console.log(`   ❌ electron-builder not found in devDependencies`);
    errors++;
  }
} else {
  console.log("   ❌ package.json not found!");
  errors++;
}

// Check 3: Electron files
console.log("\n🖥️  Checking Electron files...");
const electronFiles = ["electron/main.js", "electron/preload.js"];

electronFiles.forEach((file) => {
  if (fs.existsSync(file)) {
    console.log(`   ✅ ${file}`);
  } else {
    console.log(`   ❌ ${file} missing!`);
    errors++;
  }
});

// Check 4: electron-builder.json
console.log("\n⚙️  Checking configuration...");
if (fs.existsSync("electron-builder.json")) {
  console.log("   ✅ electron-builder.json");
  const config = JSON.parse(fs.readFileSync("electron-builder.json", "utf8"));
  console.log(`   📌 App ID: ${config.appId}`);
  console.log(`   📌 Product: ${config.productName}`);
} else {
  console.log("   ❌ electron-builder.json missing!");
  errors++;
}

// Check 5: node_modules
console.log("\n📚 Checking dependencies...");
if (fs.existsSync("node_modules")) {
  console.log("   ✅ node_modules installed");

  // Check specific packages
  const requiredPackages = ["electron", "electron-builder", "react", "vite"];
  requiredPackages.forEach((pkg) => {
    if (fs.existsSync(path.join("node_modules", pkg))) {
      console.log(`   ✅ ${pkg}`);
    } else {
      console.log(`   ❌ ${pkg} not installed`);
      errors++;
    }
  });
} else {
  console.log("   ❌ node_modules not found!");
  console.log("   ℹ️  Run: npm install");
  errors++;
}

// Check 6: Build directory
console.log("\n🎨 Checking assets...");
if (fs.existsSync("build")) {
  console.log("   ✅ build/ directory exists");

  // Check for icons
  const icons = ["icon.png", "icon.ico", "icon.icns"];
  let hasIcon = false;
  icons.forEach((icon) => {
    if (fs.existsSync(path.join("build", icon))) {
      console.log(`   ✅ ${icon} found`);
      hasIcon = true;
    }
  });

  if (!hasIcon) {
    console.log("   ⚠️  No icons found (will use default)");
    console.log("   ℹ️  Add icon.png (512x512) to build/ folder");
    warnings++;
  }
} else {
  console.log("   ⚠️  build/ directory not found");
  warnings++;
}

// Check 7: Vite config
console.log("\n⚡ Checking Vite configuration...");
if (fs.existsSync("vite.config.js")) {
  const viteConfig = fs.readFileSync("vite.config.js", "utf8");
  if (viteConfig.includes('base: "./"') || viteConfig.includes("base: './'")) {
    console.log("   ✅ Vite config updated for Electron");
  } else {
    console.log('   ⚠️  Vite config might need base: "./" for Electron');
    warnings++;
  }
} else {
  console.log("   ❌ vite.config.js not found!");
  errors++;
}

// Check 8: Documentation
console.log("\n📖 Checking documentation...");
const docs = [
  "START-HERE.md",
  "QUICK-START-DESKTOP.md",
  "DESKTOP-APP-README.md",
  "README-DESKTOP.md",
];

docs.forEach((doc) => {
  if (fs.existsSync(doc)) {
    console.log(`   ✅ ${doc}`);
  } else {
    console.log(`   ⚠️  ${doc} missing`);
    warnings++;
  }
});

// Check 9: Helper scripts
console.log("\n🔧 Checking helper scripts...");
const scripts = [
  "INSTALL-DESKTOP.bat",
  "INSTALL-DESKTOP.sh",
  "RUN-DESKTOP-DEV.bat",
  "RUN-DESKTOP-DEV.sh",
];

scripts.forEach((script) => {
  if (fs.existsSync(script)) {
    console.log(`   ✅ ${script}`);
  } else {
    console.log(`   ⚠️  ${script} missing`);
    warnings++;
  }
});

// Final Report
console.log("\n" + "=".repeat(50));
console.log("📊 Verification Report");
console.log("=".repeat(50));

if (errors === 0 && warnings === 0) {
  console.log("\n✅ Perfect! Everything is set up correctly!\n");
  console.log("Next steps:");
  console.log("1. Run development: npm run dev:electron");
  console.log("2. Build production: npm run build:electron");
  console.log("3. Read: START-HERE.md\n");
} else {
  if (errors > 0) {
    console.log(`\n❌ Found ${errors} error(s) that need to be fixed:`);
    console.log("   Run: npm install");
    console.log("   Then run this script again\n");
  }

  if (warnings > 0) {
    console.log(`\n⚠️  Found ${warnings} warning(s):`);
    console.log("   These are optional but recommended to fix\n");
  }
}

console.log("For help, read: DESKTOP-APP-README.md\n");

process.exit(errors > 0 ? 1 : 0);
