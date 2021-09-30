# docker-compose-magento-env

- Register for a Magento account [here](https://account.magento.com/customer/account/create/)
- Get authentication keys using this [guide](https://devdocs.magento.com/guides/v2.4/install-gde/prereq/connect-auth.html)
- Take note of this as it will be used later, **public key** as username, **private key** as password
- Install Magento metapackage with this [magento setup guide](https://devdocs.magento.com/guides/v2.4/install-gde/composer.html#get-the-metapackage), either use the **Open Source** or **Adobe Commerce** metapackage
- Then configure the `nginx/magento.conf` for the correct magento path
- When done with the magento setup, run `docker-compose build`
- Verify project build by running `docker-compose up -d` and visit the url specified in `magento.conf`