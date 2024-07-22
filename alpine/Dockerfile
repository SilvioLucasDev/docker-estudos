# Definindo o argumento de versão do alpine que pode ser passado na hora de buildar a imagem
ARG ALPINE_VERSION=3.20.1

# Definindo a imagem pai que será utilizada para criar a imagem
FROM alpine:${ALPINE_VERSION}

# Definindo o diretório de trabalho para instalação de pacotes na raiz do container
WORKDIR /

# Instalando nodejs e npm com apk do alpine, que é tipo o apt do ubuntu
RUN apk add --no-cache \
    nodejs \
    npm \
    git \
    nano \
    unzip

# Adiciona um usuário no SO
RUN adduser -D slds

# Define o usuário que vai rodar os próximos comandos e que será utilizado quando acessar o container
USER slds

# Definindo as variáveis de ambiente
ENV FRONT_URL="http://localhost:3000" \
    API_URL="http://localhost:3001" \
    PORT=3000 \
    MSG_TESTE_ARQUIVO="Variavel de ambiente criada no Dockerfile"

# Definindo uma variável de ambiente que será inputada no arquivo /tmp/arquivo_com_variavel_criado_pelo_dockerfile.txt quando o container for criado e será criada pelo usuário slds
RUN echo ${MSG_TESTE_ARQUIVO} > /tmp/arquivo_com_variavel_criado_pelo_dockerfile.txt

# Copiando os arquivos/diretórios para o container, ele busca a partir do contexto do Dockerfile
COPY --chown=slds:slds --chmod=777 ./files-to-container /tmp/files-copy-from-host

# Definindo o diretório de trabalho onde ficará os arquivos que compõem a aplicação
WORKDIR /opt/

# Copiando um arquivo direto da internet para o container e descompactando e removendo o arquivo compactado
ADD --chown=slds:slds --chmod=777 https://argus-academy.com/cursos/docker_-_dominando_a_criacao_e_o_gerenciamento_de_containers/server.tar.gz ./app/
RUN cd ./app && \
    tar -xvf server.tar.gz && \
    rm -f server.tar.gz

# Copiando script de inicialização para o container
COPY --chown=slds:slds --chmod=777 ./start.sh ./scripts/start.sh

# Definindo o script que será executado sempre quando o container for iniciado
ENTRYPOINT [ "./scripts/start.sh" ]

# Definindo os comandos que serão executados quando o container for iniciado
CMD [ "/bin/sh", "-c", "cd ./app && node server.js"]

# Documentando as portas que o container irá expor
EXPOSE 3000 3001

# Adicionando metadados/informações extras na imagem
LABEL maintainer="Silvio Lucas silviolucas_santos@hotmail.com"
