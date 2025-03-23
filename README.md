# Deploy Hugo site to Bunny.net

A simple example of how one can deploy a hugo site with bunny.net storage & CDN. 
You can read more avout this this in [this blog post](https://torbjorn.dev/blog/hugo-on-bunny-net).

## Instructions

1. Copy the `.github/workflows` folder and the `infra` folder into your hugo website repository.

2. Create the following secret & vars:
- **Secret:** BUNNY_API_TOKEN, your bunny.net API token
- **Variable:** FQDN, the FQDN of your website
- **Variable:** STATE_SZ_ID, the ID of an existing storage zone to store your TF state

4. Verify the functionality of your site at {fqdn with dashes instad of dots}.b-cdn.net

5. Create an ANAMA/ALIAS record that points towards {fqdn with dashes instad of dots}.b-cdn.net

6. Enjoy!

Note that this does _not_ encrypt the terraform state. 
If you end up connecting that storage zone to a pull-zone you will be publishing sensitive data. 
