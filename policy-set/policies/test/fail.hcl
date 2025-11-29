test {
  name = "plan-missing-name-tags"
  rules = {
    main = false
  }

  mock {
    # Load the real plan data
    imports = {
      "tfplan/v2" = {
        data = file("../../run-vP1DWJH7K458iznk-sentinel-mocks/mock-tfplan-v2.sentinel")
      }
    }

    # Transform the mock at load time: remove "Name" tag from aws_instance after.tags
    # This uses a mock override to produce a failing condition.
    override {
      "tfplan/v2.resource_changes" = apply(resource_changes, function(rc) {
        if rc.type is "aws_instance" and (rc.change.actions contains "create" or rc.change.actions contains "update") {
          after = rc.change.after else {}
          tags  = after.tags else {}
          # Drop Name if present
          newtags = object(filter keys(tags) as k { k != "Name" }, function(k) { tags[k] })
          rc.change.after = merge(after, { "tags": newtags })
        }
        rc
      })
    }
  }
}