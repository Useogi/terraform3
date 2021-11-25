resource "aws_key_pair" "useogi_key" {
    key_name = "useogi1-key"
    public_key = file("../../.ssh/useogi-key.pub")
    // public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQC7d+HJ75xc7vwwElr6bHbLL1P+bE3EeB7W2RcZ7WEr38ljNpxkGlE1s2EmDNMJXK4aWw9/25VJLVH3oKQrPxejNM1Dueu/ckLSPn32AbWszIFRIr/fjWdciXwXYwjlpJCgpjJkjzqg/pVMt79H5uaHHK1QDunaZwlEOKivSaTboRsR3rnGsEwiEn+5zD++flJirbWCTXacOdWkaG9Ih1EGTpGnetMbb1SpYen+IZU+eMn6wpXw6++/PluuNJ5X1+E6exKAauXAhbumn7Z89N4thV07XpuRJwEx7OlWDpdWyrGsxQoBMqCugcm1pvU6Y/a/Hsf8wi3NgbDMzWdQHCY/LpzIkcDRHu/TaZ+D9cUjRddpmC+U4BH8Z/D1pyTRTkWrSa9UApkix7DiPtiC3F1jrhGPscL2YDROGscgRWaEa+1WVlGcojloOfFl+2PbzCYoNls6KlWP6dnEsnBRpcxZosRPFFs3gKBCJ6g3Ap46k9NP0Zxm5Bpmd7a3HbH1gWE="
}