return {
    "microsoft/vscode-js-debug",
    build = "npm install --legacy-peer-deps && npx gulp vsDebugServerBundle && mv dist out",
}
