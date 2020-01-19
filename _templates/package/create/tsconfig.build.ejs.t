---
to: packages/<%= tag %>/tsconfig.build.json
---
// Specify rules which should be applied to compiler.
{
  "extends": "../../tsconfig.build.json",
  "compilerOptions": {
    "declaration": true,
    "declarationMap": true,
    "outDir": "./dist",
    "rootDir": "./src",
    "resolveJsonModule": true
  },
  "include": ["src", "typings"]
}