# SnowflakeSQL syntax

Enables SnowflakeSQL syntax highlighting.

## Installation

This repository is structured as a standard vim package / plugin.

Use your favourite package manager, or see `:h packages`.

tl;dr, assuming your vim runtime is in `~/.vim` and you don't yet have a
pereference for how to organise your packages

```sh
mkdir -p ~/.vim/pack/lang/start
git clone https://github.com/moderndatainc/vim-snowflakesql-syntax.git ~/.vim/pack/lang/start
```

## Enable

To enable for a specific buffer, `:SQLSetType snowflakesql`.

To make SnowflakeSQL your default SQL dialect, add the following to your vimrc

```
let g:sql_type_default="snowflakesql"
```
