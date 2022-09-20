

# Projeto de BI - Adventure Works 2019
Este repositório do GitHub contém arquivos utilizados na construção da solução de Business Intelligence para a empresa Adventure Works (empresa fictícia de fabricação de bicicletas), utilizando principalmente algumas  ferramentas de dados e analytics da Microsoft.

Como fonte de dados, utilizei a base de amostra OLTP, simulando um banco de dados em produção, típico para processamento de transações online em ERPs e afins. Ela pode ser baixada neste [link](https://learn.microsoft.com/en-us/sql/samples/adventureworks-install-configure).

O projeto pode ser resumido em três camadas principais:
 - STAGING: Extração dos dados brutos da fonte OLTP para carregamento no banco de dados temporário;
 - DW (Datawarehouse): Com os dados em STAGING, é feita transformação e modelagem para em seguida carregamento nas tabelas de dimensão e fato.
 - VIZ: Após tratamento e integração de dados, importamos direto do DW toda informação necessária para visualização em relatórios e dashboard.
 ![Dataflow](https://user-images.githubusercontent.com/25754870/191253450-0abcef56-16b5-4189-8290-c8d6b6b70e0b.png)

## Ferramentas utilizadas
- Para criação do diagrama da modelagem de dados foi utilizado o **[SQL Power Architect](http://www.bestofbi.com/page/architect_download_os)**;
- Para armazenamento de dados (Staging e DW)  foi utilizado o **[SQL Server 2019 Developer](https://www.microsoft.com/pt-br/sql-server/sql-server-downloads)** e para consultas no banco e agendamento dos pacotes SSIS o **[Microsoft SQL Server Management Studio 18](https://learn.microsoft.com/pt-br/sql/ssms/download-sql-server-management-studio-ssms?view=sql-server-ver16)**;
- Para criação de tabelas e processo de ETL, foi utilizado o **[Visual Studio 2019](https://visualstudio.microsoft.com/pt-br/vs/older-downloads/)** com **[SQL Server Data Tools](https://learn.microsoft.com/en-us/sql/ssdt/download-sql-server-data-tools-ssdt)** + extensão do **[SQL Server Integration Services Projects](https://learn.microsoft.com/en-us/sql/integration-services/integration-services-ssis-projects-and-solutions)**;
- Para visualização de dados o **[Power BI](https://powerbi.microsoft.com/pt-br/)**.

## Desenvolvimento
O projeto foi realizado em cinco etapas principais:
- **Levantamento de requisitos de negócio**<br>
Utilizei a matriz dimensão indicador criada no Excel, para documentar quais as métricas necessárias, a origem delas no banco de dados OLTP  e como os dados seriam relacionados no modelo dimensional.
![image](https://user-images.githubusercontent.com/25754870/191126661-1b1197fd-55bb-4670-a05b-b69cd87bca30.png)

- **Desenho do diagrama para modelagem do DW**
Utilizei o SQL Power Architect para modelar as tabelas que serão criadas no DW, utilizando a modelagem dimensional no esquema estrela.
![image](https://user-images.githubusercontent.com/25754870/191128675-cc68f3da-6e92-4833-b031-b792615bdaff.png)

- **Criação da solução no SSIS (ETL)**<br>
A solução do SSIS é divida em duas partes, sendo um projeto para criação das tabelas para STAGING e DW e, outro projeto para todo processo de ETL.

  - Para STAGING e DW, todas as tabelas foram criadas utilizando o SQL Server Database Project via Table Designer;
![image](https://user-images.githubusercontent.com/25754870/191129029-d9c485d8-5d0e-469c-a90c-74248a8ae5b5.png)

   - Para o processo de ETL, primeiro utilizamos o BCP (bulk copy program) para copiar as tabelas necessárias do OLTP de forma bruta rápida para flat files (txt), para em seguida serem carregados no banco de STAGING. Dessa forma, todas as transformações são executadas em ambiente isolado (banco de dados separado do ambiente OLTP), sem comprometer a base de produção.
![image](https://user-images.githubusercontent.com/25754870/191129281-f6c72479-af00-4bbc-93fb-412e9867fd8a.png)

  - Após carga na base de STAGING, é executado o fluxo para tratamento e carregamento dos dados nas tabelas de DIMENSÃO e tabelas de FATO.
![image](https://user-images.githubusercontent.com/25754870/191129390-277a9d82-085c-41be-ab88-457756eac077.png)
![image](https://user-images.githubusercontent.com/25754870/191129721-b70b5cd5-4c3e-49cb-9d2a-4e8bad7914c1.png)
![image](https://user-images.githubusercontent.com/25754870/191129562-855f9af3-f174-4a7b-bf5e-d56c955fabf7.png)
![image](https://user-images.githubusercontent.com/25754870/191129605-58475d25-46fe-4f3e-a6b6-c9eb76313bd3.png)

  - Todos esses pacotes do SSIS, são executados de forma sequencial em um pacote/fluxo principal;
![image](https://user-images.githubusercontent.com/25754870/191129803-676fbb68-ffb3-4c60-bdfe-aa1da1dc3e93.png)

- **Agendamento de jobs com o SQL Server Agent**<br>
O pacote principal do SSIS foi configurado no SQL Server Agent para ser executado diariamente, com alerta via e-mail contendo os logs de execução ou falha.
![image](https://user-images.githubusercontent.com/25754870/191130005-709c357a-d458-4b6c-a30e-8f05e4334876.png)

- **Criação de relatório no Power BI**<br>
Como o volume de dados era baixo, conseguimos utilizar o Power BI como camada de CUBO e visualização. Todos os dados são importados diretamente do DW, e as medidas e cálculos criados em DAX de acordo com o levantamento de requisitos de negócio. A identidade visual e toda parte de UX e UI, foi baseada em modelos de dashboards relacionados ao tema de Natureza e Aventura.
![image](https://user-images.githubusercontent.com/25754870/191130152-6d6289ad-fc03-4a9a-a0b0-92c626af9880.png)
  ![image](https://user-images.githubusercontent.com/25754870/191130346-3c8b2480-da04-41a6-b2b4-0216cf060651.png)
## Dúvidas
Envie perguntas por e-mail para: [erick.nishimoto@gmail.com](mailto:erick.nishimoto@gmail.com) .
