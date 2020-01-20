# Monorepo Boilerplate

This repository is my attempt to set up and document design system monorepository setup.

## Table of contents

1. [Introduction](#introduction)
2. [Setup](#setup)
   1. [SSH](#ssh)
   1. [Git](#git)
   1. [NodeJS](#nodejs)
   1. [NPM](#npm)
   1. [VS Code](#vscode)
   1. [EditorConfig](#editorconfig)
   1. [Yarn](#yarn)
   1. [Lerna](#lerna)
   1. [Hygen](#hygen)
   1. [ESLint](#eslint)
   1. [Prettier](#prettier)
   1. [TypeScript](#typescript)
   1. [WebPack](#webpack)
   1. [Husky](#husky)
   1. [Commitlint](#commitlint)
   1. [Lint-Staged](#lintstaged)
   1. [Storybook](#storybook)
   1. [Netlify](#netlify)
   1. [Markdown](#markdown)
   1. [Spell Check](#spellcheck)
3. [Usage](#usage)

## Introduction <a name="introduction"></a>

Some introduction text, formatted in heading 2 style

### Motivation

As a newbie developer i found that is is pretty easy to learn programming itself, but it is hard to learn project setup and management good practices. Like... think of Redux. In every single tutorial they are showing to put Actions, Reducers, etc. each in dedicated directory called `actions` and so on. You end up with single directory full with hundreds of files for each domain you are working on. Nobody at that point is talking about something like [Redux Ducks](https://github.com/erikras/ducks-modular-redux) which in my case brings in much more clarity for the project.
The same applies to UI.
An other hard part for me was that headache when i seen those example projects in GitHub with gazillion of mysterious dot files. When i was learning JavaScript, they told me that JavasCript is like the easiest language in the world and it is easy to use. Just make `index.html` place your `<script></script>` tag in and you are done! But then is seen those `.eslintrc.js`, `.prettierrc.js`, famous `package.json` and i was thinking - what the hell is happening there! Can i please write a simple javascript? Yes, you can... but soon i realized, that my single javascript file becomes a long list of gibberish. So i started to split them and my `<script></script>` tags started to stack up in my `index.html`. At that point i told... [so... JavaScript. Fuck You!](https://youtu.be/_36yNWw_07g?t=10) and become a introverted hater of JavaScript. And i went into Golang world. Felt in love. Single binary. Run everywhere. No PHP configuration nightmares. No Java class naming nightmare. BEST [community](https://invite.slack.golangbridge.org/) EVER!!!
Bla, bla, bla... landed into Go Templates.. one page, another.. but.. somewhat i wanted that SPA'ish feeling for my users. Moreover because i wanted to use WebSockets and have some real-time thingies.
And so... I need to deal with that JavaScript crap!
Research

I'm a kind of guy, who likes to bring things to their primitives. To be close to the core as possible. I am not saying that im a fan of Assembly. :) Just, i seen some projects fuc\*\*d up because of frameworks. How vendor locked they was when framework decided to switch from open source to closed source with licencing, and then in few years to increase the price of licences like 10x. Per developer. Those frameworks now are almost dead. But i got my learning, that it is really bad to be vendor locked. And mostly because of this reason i avoided to jump into React band wagon. And Angular. And Vue. Moreover after i read blogs and articles how those things work internally, how heavy their are, how complicated tooling is required. I just wanted to write JavaScript and not to learn all that crazy tooling configuration. Most of the create-react-app kind of things are crap and intended for ToDo kinda thingies. There are no best practices and you actually are skipping huge part of required learning. I am telling that now.
So i seen this thing called Web Components. Ouh... low level.. fast, web standards, your own regular `<html-tag></html-tag>`... i really liked that idea. If that is a web standard it should be future proof. So i turned on this route. And i liked it. Yes, it was little bit hard for the first time as they are low level and quite a bit boilerplate was required. But i felt in love because of encapsulation. I finally figured out a way how to organize my JavaScript mess! I started to think into components. Declare components, import it and place a tag in your html. So simple!
Then spec removed HTML Imports. And then LitElement library was released. Pretty much thats it... currently it suits perfectly for all my needs and it has a great DX. Polymer Slack community is second best community ever! Actually they booth are the Top 1 for me. :)

## Installation <a name="setup"></a>

The first paragraph text

### SSH <a name="ssh"></a>

For easy interaction with GitHub or other Git provider i recommend to set up SSH.
Add your SSH key to SSH Agent.

```sh
eval "$(ssh-agent -s)"
ssh-add ~/.ssh/id_rsa
```

Generate new default key. Its filename will be `id_rsa`

```sh
ssh-keygen -t rsa -b 4096 -C "your-username@example.com"
```

Or generate new named key. Its filename will be `github-your-username`

```sh
ssh-keygen -f ~/.ssh/github-your-username -t rsa -b 4096 -C "your-username@example.com"
```

Use `xclip` to copy your key into the main clipboard so you can paste it in your GitHub settings. Or you `cat ~/.ssh/id_rsa.pub` and copy complete content manually.

```sh
xclip -sel clip < ~/.ssh/id_rsa.pub
```

Paste it into your [GitHub Add New SSH Key](https://github.com/settings/ssh/new)

At this point your SSH setup should be done and instead of using `https://github.com/your-username/monorepo-boilerplate.git` you can now use SSH version `git@github.com:your-username/monorepo-boilerplate.git`.

In my setup i do not add SSH Keys to SSH Agent permanently. So every time i restart my Linux, i should add my keys to agent again. And i would say, that you should do the same. It brings bit more security and its not a big deal to type single command. If you will, you can make some bash script with all common commands and execute them all at once.
So, if you have some issues to clone or push code, primarily check is your ssh key added to SSH Agent.

OPTIONAL:

You can also configure ssh keys for multiple GitHub usernames.

```sh
# Empty content of file
> ~/.config/Code/User/settings.json
# Place configuration in file.
cat <<EOT >> ~/.ssh/config
Host your-username.github.com
    HostName github.com
    User your-username
    PreferredAuthentications publickey
    IdentityFile ~/.ssh/github-your-username
    IdentitiesOnly yes
Host other-username.github.com
    HostName github.com
    User other-username
    PreferredAuthentications publickey
    IdentityFile ~/.ssh/github-other-username
    IdentitiesOnly yes
EOT
```

I will not go deep into the details, but.. Yes.. that is possible and you can make some research.

[Starting point from StackOverflow](https://stackoverflow.com/questions/4665337/git-pushing-to-remote-github-repository-as-wrong-user/12438179)
[Starting point from GitHub](https://gist.github.com/jexchan/2351996)

In my experience, multiple usernames are not bad and can be used, but recently i reorganized my repositories and accounts to look more organized. Basically i migrated all my sandbox projects to one of my accounts and converted other accounts into organizations. I still can maintain my private projects in my main @dzintars account and all other projects i can distribute across organization accounts. Works pretty well. REMEMBER - Organizations can't have GitHub private repositories for free.

### NodeJS <a name="nodejs"></a>

I think, if you already are interested in TypeScript Monorepo setup, then for sure you already know what is NodeJS and why it is required there. I just listed it there for completeness.

### NPM <a name="npm"></a>

It is nice if you can do things like `import '@library/my-component` or `import { LitElement } from 'lit-element'`. In order to do so across all your projects without much pain you need to publish your component package in some package registry. Most popular registry these days is [NPM](https://www.npmjs.com/). So you need to have account there. I would recommend to use NPM Organizations to scope your packages. This way you will be able to install your packages like `yarn add @my-organization/my-component`. From my experience, using your personal account is not a good idea.

You can also use [GitHubs package registry](https://help.github.com/en/github/managing-packages-with-github-packages/configuring-npm-for-use-with-github-packages) and i will try to look into that later.

But remember one important thing. You can't delete your packages from Npmjs.com after 72h of publishing package. Because someone in theory already could rely on your package and by deleting you can broke someones build pipelines. To delete package you should email to Npmjs.com support.
To play with package publishing i personally created test organization.

### Install VS Code & Extensions <a name="vscode"></a>

VS Code is great IDE to work with, so i will not focus on other editors there. Just go to [their homepage](https://code.visualstudio.com/) and grab it for your OS.

Create your repository at [GitHub](https://github.com/new).

Go to your projects location. Mine is `cd ~/Code/github.com/dzintars` and clone your empty repository `git clone git@github.com:dzintars/monorepo-boilerplate.git`.

Open your project directory in VS Code by `code ~/Code/github.com/dzintars/monorepo-boilerplate`.

Create `.gitignore` file by:

```sh
cat <<EOT >> .gitignore
node_modules
# \.vscode/
*.log
EOT
```

I commented out `.vscode/` directory because i am interested to push my code editor settings to Git. But you can remove `#` and your VS Code settings will not be committed.

Now create that directory and settings file `touch .vscode/settings.json`. This file can contain the same settings which you can find under File -> Preferences -> Settings, but as these settings are "closer" to project, they will override system wide settings. So this is a great way to tweak your editor configuration according on project you are working on.

Populate this file with:

```json
{
  "editor.formatOnSave": true,
  "editor.formatOnPaste": false,
  "editor.defaultFormatter": "esbenp.prettier-vscode",
  "[javascript]": {
    // "editor.tabSize": 2, // Potentially overlaps with Ediorconfig extension
    "editor.formatOnSave": true,
    "editor.codeActionsOnSave": {
      // Leaving this setting there for reference. Disabled because Prettier is used for formating.
      "source.fixAll.eslint": false
    }
  },
  "[typescript]": {
    // "editor.tabSize": 2, // Potentially overlaps with Ediorconfig extension
    "editor.formatOnSave": true,
    "editor.codeActionsOnSave": {
      "source.fixAll.eslint": false
    }
  },
  "editor.codeActionsOnSave": {
    "source.fixAll.eslint": false
  },
  "eslint.debug": true,
  // "eslint.workingDirectories": [{ "mode": "auto" }],
  "eslint.workingDirectories": ["./packages"],
  "cSpell.words": ["ROADMAP", "bigint", "npmignore", "Hygen", "lintstaged"]
}
```

#### EditorConfig

Create root level config file `.editorconfig` which will be consumed by VS Code extension [EditorConfig for VS Code](https://marketplace.visualstudio.com/items?itemName=EditorConfig.EditorConfig).

```sh
> .editorconfig
cat <<EOT >> .editorconfig
root = true

[*]
charset = utf-8
end_of_line = lf
insert_final_newline = true
indent_style = space
indent_size = 2
tab_width = 2
trim_trailing_whitespace = true
quote_type = single
EOT
```

> Potential conflicts with VS Code settings. [Source](https://developercommunity.visualstudio.com/content/problem/46983/conflict-between-vs2017-text-editor-indentation-se.html)

I didn't dug deeper, but it's bit confusing how does VS Code settings play with Editorconfig, because there is some overlapping configs like `tab_width = 2` and `"[typescript]": {"editor.tabSize": 2}`. So i removed some properties from `.vscode/settings.json`.

##### Resources

[What is EditorConfig?](https://editorconfig.org/)

#### Extensions

Create new config file in `.vscode/` directory with content:

```sh
> .vscode/extensions.json
cat <<EOT >> .vscode/extensions.json
{
  "recommendations": ["esbenp.prettier-vscode", "dbaeumer.vscode-eslint", "editorconfig.editorconfig", "streetsidesoftware.code-spell-checker"],
  "unwantedRecommendations": ["hookyqr.beautify", "dbaeumer.jshint"]
}
EOT
```

This file says about recommended and not recommended VS Code extensions. So everybody, who will clone this repository will get an notifications about recommended extensions to be installed in their VS Code IDE.
So every time you add some significant extension to work with your project it is good idea to add it in this file so that consumers of your repository potentially could get similar DX (Developer Experience).

### Yarn <a name="yarn"></a>

I am writing this at 2020/JAN and at this point [Yarn](https://yarnpkg.com/lang/en/) is pretty much the only option to create monorepo as it has a concept called `workspaces` which we will use. And it's bit faster because of module caching. NPM team are not ok to give up their user base for Yarn :) , so in [their blog](https://blog.npmjs.org/post/186983646370/npm-cli-roadmap-summer-2019) they announced some work to enable workspaces and other features, but we don't know how long we should wait for that. So we will use Yarn for now.

From now you should not use `npm` command in your terminal. `yarn add -D package-name` will install local (project level) package and `-D` will add it to your `devDependencies`. `yarn global add package-name` will install package globally on your system. Most likely TypeScript is such package.

Run `yarn init -y`. It will generate `package.json` file with all the default values in it. Clear the content. Or you can create `package.json` by `touch packages.json`.

Add this content to that file:

```sh
cat <<EOT >> packages.json
}
  "name": "@my-sandbox/root",
  "workspaces": [
    "packages/*"
  ]
}
EOT
```

Because this is our repository root, this is not an NPM package and we will never publish it. Instead we will publish packages from `./packages/*` directory which we will create at next steps. You can name this package whatever you want. Name of it does not interact with NPM or GotHub or.. whatever. I am using my NPM organization name there.
Field `"workspaces"` relates to Yarn configuration, so you can read about that in Yarn documentation.

### Lerna <a name="lerna"></a>

Lerna is best friend of the Yarn when we talk about monorepositories.

Install Lerna now

```sh
yarn add -D -W lerna
```

It should be in `devDependencies`.
Rule of thumb - in your root `packages.json` you should never have any single `dependency`. All dependencies at this level will be just an `devDependencies`.

Run `lerna init` now. It will create `lerna.json` config file.

Modify your `package.json` file to look like

```sh
> package.json
cat <<EOT >> package.json
}
  "name": "@my-sandbox/root",
  "private": true,
  "workspaces": [
    "packages/*"
  ]
}
EOT
```

Property `"private": true,` says to Lerna, that this is an private package and we will not ever publish it to NPM when we will run `lerna publish`. Instead, Lerna will go into `packages/*` directory and treat every sub-directory as separate package and will execute `publish` on every package it will find there.

Modify `lerna.json` config file to look like:

```sh
cat <<EOT >> lerna.json
{
  "packages": ["packages/*"],
  "ignoreChanges": ["packages/*/test/**", "**/*.md"],
  "npmClient": "yarn",
  "useWorkspaces": true,
  "version": "independent"
}
EOT
```

Important property there is an `version` property which is set to `independent`. This means that every time we will run `lerna publish` or `lerna version` versions of our packages will be bumped independently. Lerna will check in what packages changes was made and will bump a version only for those packages. If we would not specify this property, then all packages would get same version number when we make some changes only in one package. You should pay attention to this aspect because there could be caveats if using independent versioning when packages rely each on other. MAKE RESEARCH.

TODO: Not sure about this explanation:
`ignoreChanges` is a array of sources which should be ignored by lerna for version bumping. Let's say, you made some changes in `package-x/src/template.ts` file, but you are not yet ready to do an build, but you want to publish other packages. So Lerna will ignore these sources and will look only into `dist/` directory which contains build artifacts. If those are changes, then Lerna will bump the version and will publish to Git and NPM.

Sometimes during project setup you can get some weird `yarn add xxxxx` errors and one of the most common solutions is to delete all `node_modules` directories and `yarn.lock` file. To make it easier, let's create `script` entry in our root `package.json` file.

```json
{
  "scripts": {
    "clean": "lerna clean && lerna run clean"
  }
}
```

Now you can run simple `yarn run clean` command from projects root directory and Lerna will take care about deleting all `node_modules`.

### Hygen <a name="hygen"></a>

Hygen is code a generator. Because I don't like default output of the `lerna create` and its inflexibility, we will use Hygen for package boilerplate generation.

Install hygen globally by `yarn global add hygen`. Probably you will see a warning like `warning "hygen > ts-jest@24.3.0" has unmet peer dependency "jest@>=24 <25".`. It is not a good practice to ignore an warnings, but in this case it is safe to ignore it.
try to run `hygen` in your terminal.
If you see `bash: hygen: command not found...` this means that hygen binary cant be found and we have some issues with Yarn.
Run `export PATH="$PATH:$(yarn global bin)"` for temporal solution or add this line into your `~/.bash_profile` or `~/.profile`. If you add it to the file, do not forget to log out and log in to your terminal.
[Documentation #Path Setup](https://yarnpkg.com/en/docs/install#centos-stable)

Check again, is `hygen` command available now. Should return version number.

I think, at this point you can add hygen as `devDependency` as well, because we will use it later in our `package.json#scripts`.

```sh
yarn add -D -W hygen
```

Run `hygen init self`

This will build default generator. You can red on Hygen documentation how to generate own generators, but for now I already created `package/create` generator.

If you execute `hygen package create` and enter component name you want to generate, Hygen will generate component directory and install all baseline dependencies for you.

### ESLint <a name="eslint"></a>

Linting probably is one of the most confusing parts. At least for me. If you dig thru wild wild web you will se names like `JSLint`, `JSHint`, `TSLint`, `ESLint` and probably some other. Quite confusing what should you use, right?
In short, you should use `ESLint`. `TSLint` was used by TypeScript team to lint TS source, but now it is kinda deprecated and TypeScript team is migrating to ESLint because of its speed and architecture. `JSLint` was built by Douglas Crockford and was highly opinionated with no options to customize it. Similarly can be said about `JSHint`. Just stick with `ESLint` at least for few next years.

ESLint can do 2 major things. It will highlight typos, illegal syntax an many more. It can be configured to lint different languages, like TypeScript, JavaScript, Json, Yaml, etc.. By enabling different plugins, you can configure different rules, you want to have linting. For example, you want to forbid `console.log()` statements in you source code. You can easy do this by enabling appropriate rule in `.eslintrc.js` file.
Other thing ESLint can do for you is fixing some of your issues. Not all. This is where ESLint is commonly tied together with another tool called Prettifier.

In essence, treat ESLint as tool which will show you an syntax issues while you are coding and if configured, it will not allow you to push bad code to Git repository or simply to build it.

Start by installing VS Code extension

```sh
code --install-extension dbaeumer.vscode-eslint
```

Then create VS Code project level settings file `touch .vscode/settings.json`.

Execute `eslint --init` and reply to asked questions. If you receive error like `bash: eslint: command not found...` then install it globally by `sudo yarn global add eslint`.

- How would you like to use ESLint? -> To check syntax, find problems, and enforce code style
- What type of modules does your project use? -> JavaScript modules (import/export)
- Which framework does your project use? -> None of these
- Does your project use TypeScript? -> Yes
- Where does your code run? -> Browser
- How would you like to define a style for your project? -> Use a popular style guide
- Which style guide do you want to follow? -> Airbnb: https://github.com/airbnb/javascript
- What format do you want your config file to be in? -> JavaScript

  Would you like to install them now with npm? -> n (no)

We will not use NPM as our package manager, but `eslint --init` does not offer option to set yarn as package manager. So we decline this message.

Install required packages manually with `yarn`

```sh
yarn add -D -W @typescript-eslint/eslint-plugin eslint-config-airbnb-base eslint eslint-plugin-import @typescript-eslint/parser
```

At this point we have default setup for linting with ESLint.

> One pattern i found helpful for myself is `Don't blindly copy rules from GitHub` which you have no idea what they do. Good way to go is to leave default rules and to work with your typescript. And tweak your ESLint rules as you go. Rule by rule. This way you will learn much better and you will start to remember what each rule does and how all dots are connected.

One of the first linting errors i see in my typescript is `class MyComponent Prefer default export.eslint(import/prefer-default-export)`.
This is something i want to turn off from my linting. So i need to modify my `.eslintrc.js` and to add new rule in `rules` section.

```json
  rules: {
    'import/prefer-default-export': 'off',
  },
```

These is some important concept i learned. `import/prefer-default-export` indicates that `import` is an plugin and `prefer-default-export` is an rule of the `import` plugin. In most cases plugins should be installed by yarn and should be included in `plugins` section of the `.eslintrc.js`. But in this case `import` plugin already is imported in `@typescript-eslint` plugin internally. Pay attention that in [typescript-eslint](https://github.com/typescript-eslint/typescript-eslint/blob/master/.eslintrc.js) in `plugins` section you will see `import` plugin but in `package.json` you will fine `"eslint-plugin-import": "^2.18.2"`. It turns out that you can omit `eslint-plugin-` prefix when importing plugin in `.eslintrc.js`. [Documentation](https://eslint.org/docs/user-guide/configuring#configuring-plugins)

Ideally, every time you save changes in your `.eslintrc.js` those should be immediately applied to your source file linting. But sometimes some misconfigurations or glitches happen. In those cases try to press CTRL + SHIFT + P and enter Reload Window command. This will reload VS Code in place and will restart ESLint and TSC servers.
And overall prefer `CTRL + SHIFT + P > Reload Window` instead of closing VS Code and opening it again. You will save a bit of your time and will be less annoyed. :)

You can see what linter gives you an error or warning by hovering over issue and watching at the end of the message.
For example `ts(1219)` indicates that this is error issues by TypeScript's `tsc` server.
`eslint(import/prefer-default-export)` indicates that error is issued by `ESLint` and it is `eslint-plugin-import` plugins rule named `prefer-default-export` which has been triggered. So all you need to do is go to your `.eslintrc.js` and turn that rule off if you will or fix your source code accordingly.

#### Errors encountered

`eslint(import/no-unresolved)`
[SO](https://stackoverflow.com/a/42498220/6651080)

https://www.npmjs.com/package/eslint-import-resolver-typescript

```sh
yarn add -D -W eslint-plugin-import @typescript-eslint/parser eslint-import-resolver-typescript
```

`Missing file extension for "./style"eslint(import/extensions)`
[SO](https://stackoverflow.com/a/59268871/6651080)

So basically i removed airbnb plugin to rely only on "vanilla" setup.

### Prettier <a name="prettier"></a>

Prettier is helpful tool to prettify (format) you source code. It does not fix your syntax errors, but it can replace tabs with spaces, or double quotes with single quotes etc., etc.
[Prettier vs. Linters](https://prettier.io/docs/en/comparison.html)

Start by installing VS Code extension

```sh
code --install-extension esbenp.prettier-vscode
```

Then install package itself

```sh
yarn add -D -W prettier
```

Prettier ignore file to list files and directories which we do not want to format.

```sh
> .prettierignore
cat <<EOT >> .prettierignore
node_modules
**/dist
**/.vscode

# Ignore CHANGELOG.md files to avoid issues with automated release job
CHANGELOG.md
EOT
```

And create configuration file which will be read by VS Code Prettier extension.

```sh
> .prettierrs.js
cat <<EOT >> .prettierrs.js
module.exports = {
  arrowParens: 'avoid',
  bracketSpacing: true,
  semi: true,
  singleQuote: true,
  trailingComma: 'es5',
  useTabs: false,
  tabWidth: 2,
  printWidth: 160,
};
EOT
```

### TypeScript <a name="typescript"></a>

These days i would say TypeScript is way to go. Projects we produce become more and more complex, sometimes they got Open Source Community attention, sometimes they get popular and you need to grow your team. Or you simply work in large company. I will not list all the benefits TypeScript brings on the table. I think out there are plenty of talks and resources to read and watch.

VS Code by default have TypeScript language support but is has no TypeScript compiler. So you will see some linting errors in your `*.ts` files but you will not be able to compile them to JavaScript files. Remember, browser does not understand TypeScript. He understands just JavaScript and recently WebAssembly files. So you need TypeScripts `tsc` compiler on your machine.

Install it via `yarn global add typescript` or `npm install -g typescript`.
Then check your installation `tsc --version`. Should return version number.

Run `yarn add -D -W typescript`

You can create default configuration file by executing `tsc --init`. There you will some most common configuration options and explanation.
But we will delete content of this file and will make it clean and neat.

As soon as you will create `tsconfig.json` file VS Code will pick it up for linting and you probably will see linting issues in your typescript source files.
Delete all content of this file and place this:

```json
{
  "extends": "./tsconfig.build.json"
}
```

Create new file called `tsconfig.build.json` and place this content:

```json
{
  "compilerOptions": {
    "target": "ESNext",
    "module": "ESNext",
    "moduleResolution": "node",
    "lib": ["ESNext", "dom", "dom.iterable"],
    "declaration": true,
    "declarationMap": true,
    "sourceMap": true,
    "experimentalDecorators": true,
    "strict": true,
    "baseUrl": "./packages",
    "paths": {
      "@my-sandbox/ui-*": ["./*/src"]
    },
    "allowSyntheticDefaultImports": true,
    "pretty": true
  }
}
```

TypeScript linter is looking for file named `tsconfig.json`. If it founds it, it will apply the rules listed in that file. `tsconfig.build.json` is ignored, but we import it in our `tsconfig.json` so all rules will be applied.
I think this is common practice to split your build rules and linting rules apart, because sometimes they will differ.

Next, create same files in your package root. Like `touch ./packages/my-component/tsconfig.json`.

There is one important rule, that if new `.tsconfig.json` file is found in some sub-directory, it does not automatically extends root level `.tsconfig.json`, instead new rule set will be applied downstream of that config file. If you want, you should explicitly extend root level configuration.

### WebPack <a name="webpack"></a>

### Setup Husky <a name="husky"></a>

Husky allows you to connect/listen [Git Hooks](https://githooks.com/)
Most commonly used hook is `pre-commit` hook which allows you to do some stuff before your changes got committed into Git.

Husky most commonly is used along with `lint-staged`.

Husky config could be added right into root `package.json` file, but i prefer to save configs in separate files.

### Commitlint <a name="commitlint"></a>

Commitlint helps to tidy your commit messages to look more professional and to enable some nice side effects like automatic changelog generation.

```sh
yarn add -D -W @commitlint/{cli,config-conventional}
echo "module.exports = {extends: ['@commitlint/config-conventional']}" > .commitlintrc.js
```

In `.huskyrc.js` file `hooks` section add new hook action `"commit-msg": "commitlint -E HUSKY_GIT_PARAMS"`. So, `commit-msg` git hook will call an `commitlint` and will pass `-E HUSKY_GIT_PARAMS` argument to it. Then it will validate commit message accordingly to `config-conventional` commitlint plugin rules.

You can apply some rules by your self as well. For example in your `.commitlintrc.js` file you can add new property:

```js
rules: {
    'header-case': [2, 'always', 'lower-case'],
    'scope-case': [2, 'always', 'lower-case'],
    'subject-case': [2, 'always', 'lower-case'],
  },
```

As you already see, every commit message consists of 3 parts and you can apply some rules to every of those parts.
A legend of commit message looks like this: `git commit -m "header(scope): subject"` For example, some messages could look like this: `git commit -m "chore(config): add typescript linting"`.

You can pre-define your own scopes as well to limit what scopes can be used in commit messages.

Example:

```js
module.exports = {
  extends: ['angular'],
  rules: {
    'scope-enum': [2, 'always', ['config', 'docs', 'my-component']],
  },
}
```

#### Resources

[Commitlint Documentation](https://commitlint.js.org/#/)
[Conventional Commits Specification](https://www.conventionalcommits.org/en/v1.0.0/)
[The perks of committing with conventions](https://slides.com/marionebl/the-perks-of-committing-with-conventions#/27)

### Setup Lint-Staged <a name="lintstaged"></a>

Lint-staged allows you to lint staged files (only those which has some changes). This means that all your committed files will be linted and/or prettified no matter what. You Git commit history will look nice and tidy. Even if you will make some changes outside of VS Code.

### Markdown <a name="markdown"></a>

To get markdown file linting currently i am using `davidanson.vscode-markdownlint` VS Code extension.

```sh
code --install-extension davidanson.vscode-markdownlint
```

### Setup Spell Checker <a name="spellcheck"></a>

After creating this empty repository i started with writing this README.md markdown file and so the first thing i started to care about was Spell Check.
English is not my native language, so some help from spell checking software is really welcome to me.

So installed VS Code extension called [Code Spell Checker](https://marketplace.visualstudio.com/items?itemName=streetsidesoftware.code-spell-checker)

```sh
code --install-extension streetsidesoftware.code-spell-checker
```

After extension is installed you can create `.cspell.json` configuration file in your project root directory.
This file contains all the spelling configurations and most important to me - ignored words.
All misspelled words will be marked with blue squiggly underline. Hover it and see the issue or use Quick Fix to add that word to your dictionary. Dictionary will be populated in 2 places - 1) In global VS Code `settings.json` and 2) In this local `.cspell.json` file. In general, you can move this file from project to project if you will. Just modify configs accordingly.

## Usage <a name="usage"></a>

The second paragraph text
