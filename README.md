# Projeto de BI - Adventure Works 2019

**Projeto do curso "SQL Server Integration Services (SSIS) - ETL Essencial**<br>
*Instrutor Charles Lima - Udemy*
<br><br>
Criação de um DW utilizando conceitos de Modelagem Dimensional (Star Schema e Snow Flake), e integração de dados via Integration Services 2019.

>O SQL Server Integration Services é uma plataforma para criar integração de dados em nível empresarial e soluções de transformações de dados. Use Integration Services para solucionar problemas empresariais complexos copiando ou baixando arquivos, carregando data warehouses, limpando e minerando dados e gerenciando objetos SQL Server e dados.  
>*Fonte: https://docs.microsoft.com/pt-br/sql/integration-services/sql-server-integration-services?view=sql-server-ver16*

## Ferramentas utilizadas

- Para armazenamento utilizamos o **SQL Server 2019** e  o para consultas no banco e agendamentos de jobs o **Microsoft SQL Server Management Studio 18**;
- Para criação do diagrama de modelagem de dados **SQL Power Architect**;
- Para criação de tabelas e ETL, utilizamos o **Visual Studio 2019** com **Data Tools** + extensão do **SQL Server Integration Services Projects**.

## Conceitos e técnicas utilizadas

- **Criação de diagrama de modelagem de dados para o Datawarehouse**
  - Star Schema / Constelação;
  - Tabelas Fatos e Dimensões (Incluindo Tabela Tempo/Calendário).
![modelagem-dados](https://user-images.githubusercontent.com/25754870/184405351-78ce3d96-d600-4825-af9b-9957214186a2.PNG)
 *Diagrama da modelagem utilizada para o Datawarehouse*

- **ETL (Extract, Transform, Load)**
  - Extração de dados de SQL Server para STAGE;
  - Criação de [Surrogate Keys](https://www.ibm.com/docs/en/ida/9.1?topic=keys-surrogate) (chave substituta);
  - Carga em SDC tipo1 e tipo2 (Slowly changing dimension);
  - Carga incremental de Fatos e Dimensões;
  - Criação de catálogo do SSIS para execução remota de pacotes;
  - Agendamento de execução de pacotes via SQL Server Agent;
  - Notificação por e-mail da execução do job com falha e sucesso; 
  
![vs-solucao](https://user-images.githubusercontent.com/25754870/184408874-c817f9d8-898c-486a-8adb-02ff79022e01.PNG)<br>
*Solução/projeto criado no Visual Studio*

![etl](https://user-images.githubusercontent.com/25754870/184406116-b0d3e448-3b9f-4636-8e9f-91470428a6ab.PNG)<br>
*Exemplo de tratamento de dados*

![uso-variavel](https://user-images.githubusercontent.com/25754870/184408118-6eba6436-fef4-458d-85af-2f94a7c46be0.PNG)<br>
*Uso de variável entre os pacotes*

![uso-scd2](https://user-images.githubusercontent.com/25754870/184408112-d72cf3ad-cd5e-4360-be02-eeb82962a6f5.PNG)<br>
*SCD2 (Slowly Changing Dimension Tipo 2)*

![uso-schedule](https://user-images.githubusercontent.com/25754870/184408116-c823d0f2-b796-4107-afb9-bfa5f7e72d30.PNG)<br>
*Schedule de jobs via SQL Server Agent*

![uso-email-schedule-result](https://user-images.githubusercontent.com/25754870/184408120-31e849d2-c9bd-424d-a8be-19fb8d0ccaa2.PNG)<br>
*Notificação via e-mail com log da execução*

## Certificados
- [SQL Server Integration Services (SSIS) - ETL Essencial](https://www.udemy.com/certificate/UC-884dcac2-0eec-4c61-a67e-e0a25108accf/)

