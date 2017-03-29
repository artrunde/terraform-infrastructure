# ------------------------------------------------------------------------------
# INPUT VARIABLES
# ------------------------------------------------------------------------------

terra_env = "dev"
namespace = "rodin"
region    = "eu-west-1"

# ------------------------------------------------------------------------------
# CHANGE THESE VALUES TO CORRECT STAGE NAMES WHEN USING BLUE/GREEN DEPLOYMENT
# ------------------------------------------------------------------------------

// Should be map a custom domain?
map_custom_domain = false

custom_domain_deployments = {
  active  = "j862ocdrg4:1",
  staging = "pckzm2hrh7:2"
}