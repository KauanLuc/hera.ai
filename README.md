# 🌿 Hera - Sua Assistente de Jardinagem com IA

Obtenha respostas inteligentes para todas suas dúvidas sobre plantas, flores e jardinagem!

## Como Usar a Hera

### 💬 Faça sua pergunta sobre plantas

Digite no terminal:
```bash
hera -p "sua pergunta sobre plantas aqui"
```

Exemplos práticos:
```bash
hera -p "Como regar rosas corretamente?"
hera -p "Quais plantas são boas para apartamento?"
hera -p "Como tratar pragas em hortaliças?"
```

### ⏳ O que acontece?
1. Hera mostrará: 🤖 Analisando questão... (Pode levar alguns instantes)
2. Em segundos, você receberá uma resposta completa e especializada

## 🌟 Dicas para Melhores Respostas
- Use aspas nas perguntas
- Seja específico em suas perguntas
- Inclua detalhes como tipo de planta, ambiente, sintomas (se aplicável)

## 📚 Tipos de Perguntas que Hera Pode Responder
- ✅ Cuidados com rega e solo
- ✅ Solução de problemas (folhas amarelas, pragas, etc.)
- ✅ Melhores plantas para cada ambiente
- ✅ Dicas de cultivo e poda

## 🔧 Requisitos para Testar a Versão de Desenvolvimento
**🌱 Hera está em desenvolvimento constante para te ajudar cada vez melhor!**

Atualmente a aplicação só roda como modo desenvolvimento. Para testar a Hera em fase de desenvolvimento, você precisará:
1. [Lua 5.3](https://www.lua.org/) instalado em seu sistema
2. [Ollama](https://ollama.com/) instalado e configurado com o modelo [gemma3:1b](https://ollama.com/library/gemma3:1b)
3. [Neo4j](https://neo4j.com/) instalado e rodando

Passos para configuração:
1. Clone o repositório
2. Navegue até a raiz do projeto e instale as dependências do projeto com:
```bash
luarocks build --only-deps
```
3. Teste Hera com:
```bash
lua src/main.lua -p "sua pergunta sobre flora aqui"
```

## 🐳 Containerização
Futuramente disponilizaremos a Hera em containers Docker, o que irá:
- Simplificar a instalação e execução
- Reduzir conflitos de dependências
- Facilitar o desenvolvimento colaborativo

## ⚠️ Aviso Importante
As respostas são geradas por IA e devem ser consideradas como orientações gerais. Para casos críticos, consulte sempre um especialista.
