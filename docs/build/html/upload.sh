VERSION=0.6
echo "Uploading everything to version $VERSION"
aws s3 sync --acl public-read . s3://developers.labsland.com/labdiscoverylib/en/$VERSION/
aws s3 sync --acl public-read . s3://developers.labsland.com/labdiscoverylib/en/stable/
aws cloudfront create-invalidation --distribution-id=E1C70C27Q56411 --paths "/labdiscoverylib/en/$VERSION/*"
aws cloudfront create-invalidation --distribution-id=E1C70C27Q56411 --paths "/labdiscoverylib/en/stable/*"

