### Getapps
      Ruby version: 3.0.1

### Steps to run the application

0. To load a script file 
    
    ```
        source .getapp_import.sh
    ```

1. To run a script file for Capterra
    
    ```
        getapp_import capterra feed-products/capterra.yaml
    ```

2. To run a script file for Softwareadvice
    
    ``` 
        getapp_import softwareadvice feed-products/softwareadvice.json
    ```

3. (Optional)To run an application from irb, open irb

     ``` 
        require_relative 'import'
        Import.new("capterra", "feed-products/capterra.yaml").run
        Import.new("softwareadvice", "feed-products/softwareadvice.json").run
     ```

4. To run test cases using rspec run

     ``` 
        bundle install
        rspec
     ```


    