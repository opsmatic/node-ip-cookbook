# node-ip cookbook

Used to set a static IP on a node

# Requirements

For every host that you want to have a static IP, create a `nodes` databag in the following format (hostname is 'foo' in this example):

```json
{
    'id': 'foo',
    'interfaces': {
        'eth0': {
            'address': '1.2.3.4',
            'netmask': '255.255.255.0',
            'gateway': '1.2.3.1',
            ...
        }
    }
}
```

# Usage

Add `recipe[node-ip]` to the run list.

Every interface in the `interfaces` hash will be configured using the values in the has.

If the above data bag does not exist or does not have an `interfaces` key, nothing will be done 

## Testing

I can't get the Vagrant/Berkshelf integration to work correctly with databags, so the Vagrant test does not currently pass. Questionable if it would anyway,
since it would probably break Virtualbox or Vagrant networking.

# Recipes

There's only the `default` recipe for now, which will do what is described under Usage

# Author

Author:: Mikhail Panchenko <m@mihasya.com> 
