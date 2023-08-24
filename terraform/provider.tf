terraform {
  backend "s3" {
    bucket = "terraform_state_bucket"
    key    = "path/to/my/key"
    region = "us-east-1"
  }
}

export KOPS_STATE_STORE="kops-state-bk2"
  export NODE_SIZE="m5.large"
  export ZONES="us-east-1a,us-east-1b,us-east-1c"
  kops create cluster kubeclusterapp.com \
  --node-count 3 \
  --zones $ZONES \
  --node-size $NODE_SIZE \
  --control-plane-size $CONTROL_PLANE_SIZE \
  --control-plane-zones $ZONES \
  --networking cilium \
  --topology private \
  --cloud=aws \
  --bastion="true" \
  --out=./terraform/main.tf \
  --target=terraform