#!which node

const fs = require("fs");
const parser = require("@babel/parser");
const t = require("@babel/types");
const generate = require("@babel/generator").default;
const traverse = require("@babel/traverse").default;

const [_nodePath, _scriptPath, filePath] = process.argv;
const useClientDirective = "use client";

let file = fs.readFileSync(filePath, "utf-8");

const ast = parser.parse(file, {
  sourceType: "module",
});

let hasUseClient = false;

traverse(ast, {
  StringLiteral: function (path) {
    if (path.node.value === useClientDirective) {
      hasUseClient = true;
      path.remove();
      return;
    }
  },
});

if (hasUseClient) {
  traverse(ast, {
    Program(path) {
      path.unshiftContainer("body", t.stringLiteral(useClientDirective));
    },
  });

  let modified = generate(ast).code;
  fs.writeFileSync(filePath, modified);
}
