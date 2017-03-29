# ------------------------------------------------------------------------------
# INPUT VARIABLES
# ------------------------------------------------------------------------------

terra_env = "dev"
namespace = "rodin"
region    = "eu-west-1"

# ------------------------------------------------------------------------------
# CHANGE THESE VALUES TO CORRECT STAGE NAMES WHEN USING BLUE/GREEN DEPLOYMENT
# ------------------------------------------------------------------------------

map_custom_domain = true

custom_domain_deployments = {
  active  = "j862ocdrg4:1",
  staging = "pckzm2hrh7:2"
}