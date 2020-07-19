# Smart Pensions Code Challenge

SmartPensions code challenge completed by [Kyle Welsby](https://github.com/kylewelsby).

Here I shall write a library that satisfies the requirements defined in [CHALLENGE.pdf](./CHALLENGE.pdf)

Useful Notes througout development can be found in [NOTES.md](./NOTES.md)

## ⚡️ System Dependencies
This project expects Ruby 2.x is installed on your system. 

_At time of writing the latest stable verion is Ruby 2.7.1_

## 🎲 Installation

Currently theres no external dependencies, so no requirement to install anything other than Ruby that is already assumed on your system

## 🎯 Usage

#### Modes

- `sessions` total hit count for each page
- `unique` unique hit count for each page

Default mode is to return the total page hit count.
```bash
ruby ./parser.rb ./test/fixtures/webserver.log
```

You can pass a second argument to select another mode

```bash
ruby ./parser.rb ./test/fixtures/webserver.log unique
```

## 🤖 Testing

```bash
ruby test/parser_test.rb
```

## 🚨 Linting

This project assumes you have `rubocop` installed globally.

```bash
rubocop .
```

## 🎓 License
MIT: https://kylewelsby.mit-license.org