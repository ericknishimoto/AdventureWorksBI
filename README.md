# Projeto de BI - Adventure Works 2019
Este repositório contém arquivos utilizados na construção da solução de Business Intelligence para a empresa Adventure Works (empresa fictícia de fabricação de bicicletas), utilizando principalmente ferramentas de dados e analytics da Microsoft.
<br>
Como fonte de dados, utilizei a [base de amostra OLTP](https://learn.microsoft.com/en-us/sql/samples/adventureworks-install-configure), simulando um banco de dados em produção, típico para processamento de transações online em sistemas ERP e etc.

---

O projeto pode ser resumido em três camadas principais:
 - **STAGING**: Extração dos dados brutos da fonte de dados OLTP para carregamento no banco de dados temporário;
 - **DW (Datawarehouse)**: Com os dados em STAGING, é feita toda transformação e modelagem dos dados, para em seguida carregamento nas tabelas de dimensão e fato.
 - **VIZ**: Após integração dos dados, todas as informações necessárias são importadas diretamente do DW, alimentando as métricas e cálculos nos relatórios e dashboard.
 ![Dataflow](https://user-images.githubusercontent.com/25754870/191268410-a58b7855-b9f8-49d4-b6d6-d5f98ac8e08f.png)

## Ferramentas utilizadas
- Para criação do diagrama da modelagem de dados foi utilizado o **[SQL Power Architect](http://www.bestofbi.com/page/architect_download_os)**;
- Para armazenamento de dados (STAGING e DW)  foi utilizado o **[SQL Server 2019 Developer](https://www.microsoft.com/pt-br/sql-server/sql-server-downloads)** e para consultas no banco e configuração dos agendamento dos pacotes SSIS o **[Microsoft SQL Server Management Studio 18](https://learn.microsoft.com/pt-br/sql/ssms/download-sql-server-management-studio-ssms?view=sql-server-ver16)**;
- Para criação de tabelas e processo de ETL, foi utilizado o **[Visual Studio 2019](https://visualstudio.microsoft.com/pt-br/vs/older-downloads/)** com **[SQL Server Data Tools](https://learn.microsoft.com/en-us/sql/ssdt/download-sql-server-data-tools-ssdt)** + extensão do **[SQL Server Integration Services Projects](https://learn.microsoft.com/en-us/sql/integration-services/integration-services-ssis-projects-and-solutions)**;
- Para criação dos relatórios e dashboard o **[Power BI](https://powerbi.microsoft.com/pt-br/)**.

## Desenvolvimento
O projeto foi realizado em cinco etapas principais:
- [x] **Levantamento de requisitos de negócio**<br>
Foi utilizada a Matriz Dimensão Indicador criada no Excel para documentar quais as métricas necessárias, a origem delas no banco de dados OLTP  e como os dados seriam relacionados no modelo dimensional.
![image](https://user-images.githubusercontent.com/25754870/191126661-1b1197fd-55bb-4670-a05b-b69cd87bca30.png)

- [x] **Desenho do diagrama para modelagem do DW**<br>
Com o SQL Power Architect foi criada a modelagem das tabelas para o DW, utilizando a Modelagem dimensional no Esquema estrela.
![image](https://user-images.githubusercontent.com/25754870/191128675-cc68f3da-6e92-4833-b031-b792615bdaff.png)

- [x] **Criação da solução no SSIS (ETL)**<br>
A solução do SSIS é divida em duas partes, sendo um projeto para criação das tabelas para STAGING e DW e outro projeto para todo processo de ETL.

  - Para STAGING e DW, todas as tabelas foram criadas utilizando o SQL Server Database Project via Table Designer;
![image](https://user-images.githubusercontent.com/25754870/191129029-d9c485d8-5d0e-469c-a90c-74248a8ae5b5.png)

   - Para o processo de ETL, primeiro utilizamos o BCP (bulk copy program) para copiar as tabelas necessárias do OLTP de forma bruta, porém rápida, em flat files (txt), para em seguida serem carregados no banco de STAGING. Dessa forma, todas as transformações são executadas em ambiente isolado (banco de dados separado do ambiente OLTP), sem comprometer a base de produção.
![image](https://user-images.githubusercontent.com/25754870/191129281-f6c72479-af00-4bbc-93fb-412e9867fd8a.png)

  - Após carga na base de STAGING, é executado o fluxo para tratamento e carregamento dos dados nas tabelas de DIMENSÃO e tabelas de FATO.
![image](https://user-images.githubusercontent.com/25754870/191129390-277a9d82-085c-41be-ab88-457756eac077.png)
![image](https://user-images.githubusercontent.com/25754870/191129721-b70b5cd5-4c3e-49cb-9d2a-4e8bad7914c1.png)
![image](https://user-images.githubusercontent.com/25754870/191129562-855f9af3-f174-4a7b-bf5e-d56c955fabf7.png)
![image](https://user-images.githubusercontent.com/25754870/191129605-58475d25-46fe-4f3e-a6b6-c9eb76313bd3.png)

  - Todos esses pacotes do SSIS, são executados de forma sequencial dentro de um pacote/fluxo principal;
![image](https://user-images.githubusercontent.com/25754870/191129803-676fbb68-ffb3-4c60-bdfe-aa1da1dc3e93.png)

- [x]  **Agendamento de jobs com o SQL Server Agent**<br>
O pacote principal do SSIS foi configurado no SQL Server Agent para ser executado diariamente, com alerta via e-mail contendo os logs de execução ou falha.
![image](https://user-images.githubusercontent.com/25754870/191130005-709c357a-d458-4b6c-a30e-8f05e4334876.png)

- [x]  **Criação de relatório no Power BI**<br>
Como o volume de dados era baixo, foi utilizado próprio Power BI como camada de CUBO e também visualização. Todos os dados são importados diretamente do DW, e as medidas e cálculos criados em DAX de acordo com o levantamento de requisitos de negócio. A identidade visual e toda parte de UX e UI, foi baseada em modelos de dashboards relacionados ao tema de Natureza e Aventura. <br>
![image](https://user-images.githubusercontent.com/25754870/191130346-3c8b2480-da04-41a6-b2b4-0216cf060651.png)![image](https://user-images.githubusercontent.com/25754870/191130152-6d6289ad-fc03-4a9a-a0b0-92c626af9880.png)
[Ver relatório online](https://app.powerbi.com/view?r=eyJrIjoiYTRkOTc2NTYtY2Y0Ny00MTVjLTgyMGYtMTdkYmEyYmY1NDFiIiwidCI6Ijc2ODE4YzFjLWIyMzctNGVjYy1hMGZkLTI5NmI5ODUwNDIwNiJ9&pageName=ReportSection96714d353a93b8c35fe2)

## Créditos
- AdventureWorks sample databases: https://learn.microsoft.com/en-us/sql/samples/adventureworks-install-configure <br>
- Inspiração de layout do dashboard: https://dribbble.com/shots/16605185-Company-Cash-Dashboard

## Contato
Dúvidas e sugestões, fique à vontade para entrar em contato. <br> <br>
Linkedin: https://www.linkedin.com/in/ericknishimoto/ <br>
Blog : https://ericknishimoto.com.br <br>
Email: erick.nishimoto@gmail.com
