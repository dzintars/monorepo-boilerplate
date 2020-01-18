---
inject: true
to: packages/<%= tag %>/package.json
after: devDependencies
skip_if: typescript
sh: yarn workspace @my-sandbox/<%= tag %> add --dev typescript
---
"typescript":"*"
