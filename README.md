# ruby-dynamodb
ruby + dynamodb integration using AWS SDK

Prerequistics: 

https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/DynamoDBLocal.DownloadingAndRunning.html

In this repo, explained following operations into dynamodb

`List Tables`
`Create Table`
`Put Item`
`Get Item`
`Delete Item`
`Delete Table`

Run the command for executing all the above mentioned commands
`QueryManager.run_commands` -- where as mentioned into `query_manager.rb`

If you want to run commands specifically, navigate to the files you want to run ,pls 
uncomment the line 

`#require_relative '../base_configuration.rb'`