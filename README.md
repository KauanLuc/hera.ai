![image](https://img.shields.io/badge/Lua-2C2D72?style=for-the-badge&logo=lua&logoColor=white)
![Ollama](https://img.shields.io/badge/Ollama-7C4DFF?style=for-the-badge&logo=ollama&logoColor=white)
![Neo4j](https://img.shields.io/badge/Neo4j-018bff?style=for-the-badge&logo=neo4j&logoColor=white)
![AI Gardening Assistant](https://img.shields.io/badge/AI%20Gardening%20Assistant-4CAF50?style=for-the-badge&logo=leaf&logoColor=white)
![GitHub repo size](https://img.shields.io/github/repo-size/KauanLuc/hera.ai?style=for-the-badge)
# 🌿 Hera - Sua Assistente de Jardinagem com IA

Obtenha respostas inteligentes para todas suas dúvidas sobre plantas, flores e jardinagem!

## Como Usar a Hera

### 💬 Faça sua pergunta sobre plantas

Digite no terminal:
```bash
hera prom "sua pergunta sobre plantas aqui"
```
ou
```bash
hera prom "sua pergunta sobre plantas aqui" html
```

Exemplos práticos:
```bash
hera prom "Como regar rosas corretamente?"
hera prom "Quais plantas são boas para apartamento?"
hera prom "Como tratar pragas em hortaliças?" html
```

**⏳ O que acontece?**
1. Hera mostrará: 🤖 Analisando questão... (Pode levar alguns instantes)
2. Em segundos, você receberá uma resposta completa e especializada
> Caso você tenha passado como parâmetro a flag `html` a resposta é convertida para formato HTML com:
> 
> Sua pergunta original destacada e Resposta formatada com marcação adequada
>
> Um arquivo `response-hera-data-atual.html` é criado no diretório atual

**🌟 Dicas para Melhores Respostas:**
- Use aspas nas perguntas
- Seja específico em suas perguntas
- Inclua detalhes como tipo de planta, ambiente, sintomas (se aplicável)

**📚 Tipos de Perguntas que Hera Pode Responder:**
- ✅ Cuidados com rega e solo
- ✅ Solução de problemas (folhas amarelas, pragas, etc.)
- ✅ Melhores plantas para cada ambiente
- ✅ Dicas de cultivo e poda

### 💾 Adicionar uma nova planta ao banco de dados

Para adicionar informações sobre uma nova planta, digite no terminal e presione `Enter`:
```bash
hera add nome_da_planta
```

**📝 O que acontece?**
1. Hera irá guiá-lo através de um questionário interativo para coletar:
 - Contexto de cultivo (onde a planta vive)
 - Seus cuidados diários com a planta
 - Problemas que sua planta possui
2. Você poderá adicionar múltiplos problemas (digite `/sair` para finalizar)
3. Todos os dados serão salvos no banco de dados Neo4j para serem usadas para responder futuras perguntas

Exemplo prático:
```
hera add Manjericão
> 🤖 Digite qual o contexto que o(a) manjericão vive: 
Quintal, luz do sol direta
> 🤖 Digite quais são os cuidados diários com o(a) manjericão: 
6 horas de sol por dia, vaso com drenagem, rega de 2 em 2 dias, poda 1x ao mês, adubação de 3 em 3 meses
> 🤖 Digite quais problemas o(a) manjericão tem: 
Folhas murchas
Folhas amareladas
Galhos pensos
/sair
🤖 manjericão adicionado(a) com sucesso
```

**💡 Dicas para melhor cadastro:**
- Seja específico nos cuidados e contexto
- Liste todos os problemas que sua planta possui

## 🔧 Requisitos para Testar e Contribuir com a Versão de Desenvolvimento
**🌱 Hera está em desenvolvimento constante para te ajudar cada vez melhor!**

Para testar e contribuir para a Hera em fase de desenvolvimento, você precisará:
1. [Lua 5.3](https://www.lua.org/) instalado em seu sistema
2. [Ollama](https://ollama.com/) instalado e configurado
3. [Neo4j](https://neo4j.com/) instalado e rodando

Passos para configuração:
1. Clone o repositório
2. Navegue até a raiz do projeto e instale as dependências do projeto com:
```bash
luarocks build --only-deps
```
3. Crie um arquivo `.env` e defina as variáveis de ambiente. Ex:
```dotenv
NEO4J_PRINCIPAL=neo4j
NEO4J_CREDENTIAL=sua_senha_neo4j
OLLAMA_MODEL=gemma3:1b # ou qualquer outro modelo
```
4. Teste Hera com:
```bash
lua src/main.lua prom "sua pergunta sobre flora aqui"
```

## 🐳 Containerização
Futuramente disponilizaremos a Hera em containers Docker, o que irá:
- Simplificar a instalação e execução
- Reduzir conflitos de dependências
- Facilitar o desenvolvimento colaborativo

## ⚠️ Aviso Importante
As respostas são geradas por IA e devem ser consideradas como orientações gerais. Para casos críticos, consulte sempre um especialista.
