#!/bin/bash

echo "🚀 Iniciando Gênese AtmAI no novo repositório..."

# Configuração do novo link
REPO_URL="https://github.com/flavioparah/atmai-site-concept.git"
BRANCH="main"

# 1. Garante que o atmai-site.html vire o index.html principal
if [ -f "~/Downloads/atmai-site.html" ]; then
    cp ~/Downloads/atmai-site.html index.html
    echo "✅ HTML copiado dos Downloads."
fi

# 2. Cria o arquivo de configuração para o Coolify (Node.js)
echo '{"name":"atmai-site","version":"1.0.0","scripts":{"start":"node server.js"},"dependencies":{"express":"^4.18.2"}}' > package.json

# 3. Cria o servidor que o Coolify vai executar
echo "const express = require('express');const path = require('path');const app = express();const port = process.env.PORT || 8080;app.use(express.static(path.join(__dirname)));app.get('/', (req, res) => res.sendFile(path.join(__dirname, 'index.html')));app.listen(port, '0.0.0.0');" > server.js

# 4. Sincroniza com o GitHub novo
git init
git remote remove origin 2>/dev/null
git remote add origin $REPO_URL
git branch -M $BRANCH

# 5. Push Final
git add .
git commit -m "feat: setup completo para deploy no coolify"
git push -u origin $BRANCH --force

echo "✨ Tudo pronto no GitHub! O terreno está limpo."