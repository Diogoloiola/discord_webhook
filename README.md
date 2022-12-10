## Cliente para Webhook do Discord

Um cliente simples para o webhook do discord.

### Baixando o projeto

### Executando o projeto

Para conseguir manipular o webhook você deve acessar <a href="https://discord.com/developers/docs/resources/webhook">aqui</a> para conseguir a url do canal
que você quer colocar as mensagens. Dentro da pasta ``examples`` você encontrar um exemplo bem simples mensagem que pode ser usada para teste.


#### Exemplo

    require_relative '../lib/client'
    require_relative '../lib/models/message'
    require_relative '../lib/models/embed'

    message = Models::Message.new(
        username: 'Bot Test',
        content: 'Free code Camp',
        embeds: [Models::Embed.new(title: 'Free Code Camp', description: 'https://www.youtube.com/@freecodecamp')]
    )

    discord_client = Client.new(webhook_url)

    discord_client.messages.create(message)

