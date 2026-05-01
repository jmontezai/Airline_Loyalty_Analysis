# ✈️📊 Airline Loyalty Analysis — Churn & Customer Value

## 🚀 Resumo Executivo

Neste projeto, identifiquei um churn de 12,35% num programa de fidelização e descobri que a diminuição da atividade dos clientes (menos voos) é o principal sinal de abandono.

A análise mostra que quando os clientes deixam de usar o serviço com frequência, têm maior probabilidade de sair, o que representa um risco direto para a retenção e para a receita — especialmente nos clientes de maior valor.

Além disso, foi possível identificar os grupos com maior risco de churn, criando uma oportunidade clara para agir mais cedo e melhorar a retenção de clientes.



## 📌 Visão Geral do Projeto

Este projeto analisa o comportamento dos clientes, o desempenho do programa de fidelização e os padrões de churn de uma companhia aérea.

O objetivo foi construir uma solução analítica end-to-end, desde a criação e preparação dos dados em SQL até à criação de um dashboard interativo em Power BI, focado em insights de negócio.



## 🎯 Objetivos de Negócio

- Analisar a evolução do churn ao longo do tempo  
- Identificar segmentos com maior risco de churn  
- Compreender a relação entre atividade dos clientes e retenção  
- Avaliar o valor dos clientes através do CLV  
- Monitorizar métricas-chave:
  - Total de Clientes  
  - Clientes Ativos  
  - Clientes Churned  
  - Churn Rate  
  - Retention Rate  
  - Total Flights  
  - Customer Lifetime Value (CLV)  



## 🛠️ Ferramentas e Tecnologias

- SQL Server → criação da base de dados, limpeza, transformação e modelação  
- Power BI → visualização de dados e desenvolvimento do dashboard  
- DAX → criação de medidas e cálculos analíticos  



## 🧠 Preparação dos Dados (SQL)

Foi criado um schema dedicado Analytics por cima dos dados brutos no schema Loyalty, separando os dados operacionais dos dados prontos para análise.

### Principais passos:

- Criação da base de dados `Airline_Loyalty_Analysis`  
- Criação dos schemas:
  - Loyalty
  - Analytics
- Criação das tabelas:
  - Calendar
  - Customer_Flight_Activity
  - Customer_Loyalty_History
- Importação dos dados através de BULK INSERT  
- Conversão de tipos de dados para formatos corretos  
- Agregação da atividade de voos por cliente, ano e mês  
- Correção de salários negativos usando ABS()  
- Criação da coluna SalaryMissing para identificar salários em falta  
- Criação da coluna IsActive para análise de churn:
  - 1 = cliente ativo  
  - 0 = cliente churned  
- Criação de views analíticas:
  - VW_Calendar
  - VW_Customer_Flight_Activity
  - VW_Customer_Loyalty_History  

👉 Resultado: dataset limpo e preparado para análise em Power BI.



## 📊 Dashboard

O dashboard está dividido em quatro páginas principais:

### Overview

- KPIs: Total Customers, Active Customers, Churned Customers, Churn Rate, Retention Rate  
- Evolução da base de clientes vs churn  
- Distribuição por loyalty card e enrollment type  
- Análise por cidade (clientes, churn, voos e CLV)  

---

### Churn Analysis

- Churn rate ao longo do tempo  
- Churn por loyalty card e enrollment type  
- Churn por cidade  
- Months to churn  

---

### Loyalty Analysis

- Total CLV e Average CLV  
- Average Points per Customer  
- Redemption Rate  
- CLV por segmento  

---

### Geography

- Distribuição geográfica dos clientes  
- Mapa com métricas por cidade  



## 📸 Dashboard Preview

### Overview
![Overview](Power_BI/Images/01_Overview.png)

### Churn Analysis
![Churn Analysis](Power_BI/Images/02_Churn_Analysis.png)

### Loyalty Analysis
![Loyalty Analysis](Power_BI/Images/03_Loyalty_Analysis.png)

### Geography
![Geography](Power_BI/Images/04_Geography.png)



## 📖 Data Dictionary

Available in: `Docs/data_dictionary.md`



## 💡 Principais Insights

📈 A base de clientes cresceu ao longo do tempo, mas o churn também aumentou, mostrando que o crescimento não está a ser acompanhado por boa retenção.

✈️ A diminuição no número de voos é um dos principais sinais de churn, indicando que quando os clientes deixam de usar o serviço com frequência, acabam por sair pouco tempo depois.

👥 Clientes Aurora têm maior valor (CLV), mas também maior churn, o que representa um risco direto de perda de receita nos clientes mais importantes.

🌍 Algumas cidades apresentam níveis mais elevados de churn, o que pode indicar diferenças no comportamento dos clientes ou possíveis problemas locais.

📊 A baixa utilização de pontos (redemption rate) mostra que muitos clientes não estão a aproveitar os benefícios, o que pode reduzir o engagement com o programa.

🔗 No geral, os dados indicam que o churn está fortemente ligado à perda de engagement ao longo do tempo — clientes que usam menos o serviço tendem a abandonar o programa.



## 💼 Business Recommendations

📌 Criar campanhas para clientes que começaram a voar menos, para tentar recuperar o interesse antes de abandonarem o programa.

🎯 Dar mais atenção aos clientes Aurora, porque têm maior valor, mas também maior probabilidade de sair.

🎁 Incentivar o uso de pontos com ofertas mais atrativas, já que muitos clientes acumulam mas não utilizam.

🌍 Analisar melhor as cidades com mais churn para perceber o que pode estar a causar essa diferença.



## ⚠️ Limitações

- Dataset simulado  
- Não inclui fatores externos como campanhas, preços ou concorrência  
- Não existem razões explícitas para cancelamento  



## 🚀 Próximos Passos

- Aprofundar a segmentação de clientes  
- Analisar padrões para antecipar churn  
- Melhorar estratégias de engagement  
- Aumentar a utilização de pontos  



## 📂 Estrutura do Projeto

    Dataset/
    SQL_Analysis/
    Power_BI/
    ├── Airline_Loyalty_Analysis.pbix
    └── Images/
    README.md



## 👤 Autor

Projeto desenvolvido por João, focado em análise de dados end-to-end e tomada de decisão baseada em dados.
