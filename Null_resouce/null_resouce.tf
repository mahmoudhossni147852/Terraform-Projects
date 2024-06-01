resource "null_resource" "null_resource_example" {
    provisioner "local-exec" {
        command = "echo hello null resouces"
    }
  
}