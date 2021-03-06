---
to: packages/<%= tag %>/package.json
---
{
  "private": false,
  "name": "@my-sandbox/<%= tag %>",
  "description": "Testing NPM publishing",
  "version": "0.0.0",
  "author": "Dzintars Klavins <dzintars.dev@gmail.com> (https://dzintars.dev)",
  "homepage": "https://github.com/dzintars/monorepo-boilerplate/tree/master/packages/<%= tag %>#readme",
  "license": "MIT",
  "main": "dist/index.js",
  "module": "dist/index.js",
  "type": "module",
  "types": "dist/index.d.ts",
  "keywords": [
    "web component",
    "lit-element",
    "typescript"
  ],
  "publishConfig": {
    "access": "public"
  },
  "repository": {
    "type": "git",
    "url": "git+https://github.com/dzintars/monorepo-boilerplate.git",
    "directory": "packages/<%= tag %>"
  },
  "bugs": {
    "url": "https://github.com/dzintars/monorepo-boilerplate/issues",
    "email": "dzintars.dev@gmail.com"
  },
  "files": [
    "custom-elements.json",
    "/dist/",
    "/src/"
  ],
  "scripts": {
    "build": "tsc -b tsconfig.build.json",
    "clean": "tsc -b tsconfig.build.json --clean && rm -rf tsconfig.build.tsbuildinfo",
    "format": "prettier --write \"./**/*.{ts,js,json,md}\" --ignore-path ../../.prettierignore",
    "lint": "eslint . --ext .js,.ts --ignore-path ../../.eslintignore",
    "typecheck": "tsc -p tsconfig.json --noEmit"
  }
}
