module.exports = {
  env: {
    commonjs: true,
    es6: true,
    node: true
  },
  extends: ["eslint:recommended", "prettier"],
  globals: {
    Atomics: "readonly",
    SharedArrayBuffer: "readonly"
  },
  parserOptions: {
    ecmaVersion: 2018,
    ecmaFeatures: {
      impliedStrict: true
    }
  },
  plugins: ["prettier"],

  rules: {
    "prettier/prettier": "error",
    "no-unused-vars": [
      1,
      {
        ignoreSiblings: true,
        argsIgnorePattern: "req|res|next|^err"
      }
    ],
    "no-console": "off",
    "prettier/prettier": "error",
    indent: ["error", 2],
    quotes: ["error", "double"],
    semi: ["error", "never"]
  }
}
