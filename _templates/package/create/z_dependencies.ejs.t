---
inject: true
to: packages/<%= tag %>/package.json
after: dependencies
skip_if: lit-element
sh: yarn workspace @my-sandbox/<%= tag %> add lit-element
---
"lit-element":"*"
