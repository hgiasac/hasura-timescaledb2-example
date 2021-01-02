FROM hasura/graphql-engine:v1.3.2.cli-migrations-v2

RUN wget --no-check-certificate -qO /bin/hasura-cli \ 
      https://github.com/hgiasac/graphql-engine/releases/download/v1.3.2-cli-migration-native/cli-hasura-linux-amd64 \
      && chmod +x /bin/hasura-cli

RUN wget --no-check-certificate -qO /bin/docker-entrypoint.sh \ 
      https://github.com/hgiasac/graphql-engine/releases/download/v1.3.2-cli-migration-native/docker-entrypoint.sh \
      && chmod +x /bin/docker-entrypoint.sh

# COPY migrations /hasura-migrations
# COPY metadata /hasura-metadata
