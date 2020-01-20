---
to: packages/<%= tag %>/tsconfig.build.json
---
{
  "extends": "../../tsconfig.build.json",
  "compilerOptions": {
    "composite": true,
    "outDir": "./dist",
    "rootDir": "./src"
  },
  "include": ["src/*.ts"]
}
