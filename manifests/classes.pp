class wuk_defaults{
  class {'all_defaults': }
  class {'beluga_groups': }
  class {'beluga_users': }
}

class all_defaults {
  class { 'beluga':
    stage => pre,
  }
}

class prod_defaults {
  class {'beluga_defaults': }

  class { 'sudo':
    purge                     => false,
    config_file_replace       => false,
  }
}

class beluga_users {
  beluga::user { 'noels':
    uid => 5003,
    groups => ['webteam'],
    ssh_key => 'AAAAB3NzaC1yc2EAAAADAQABAAABAQCuc0SV/j8yeDKINo8WOcaxrAbBxZuriZmT2OlXYEbZ3cWyzzevbI+nMcTc9UiivnFmFgTgV75qIlhv3p+dULF7Otu1fvGGFA0EY3ljeOPLqvF5hiqTmXDSvOEI3HQ0H5jiEWMmsFCSnVu5AaXuGKmHeotjQEczyYQmw0C7i8YV+HdnxlaN3A18SwzqfIClwuRDWogF3h3cQlHjXh4Kp68UOUB5LEX1XYP2/2l/dlXp+twJK7r/RI0JkLNLLDXaZjQpOkOVcuamcYemhbiDT4szVRz2SIkWAO/OwnGYOU0Zklv+7DJ1g1Gs8EQtr1l3LA6lv7Ah++kKUVKkUR8OkJlR',
    key_type => 'ssh-rsa',
  }

  beluga::user {'jasonb':
    uid => 5004,
    groups => ['webteam'],
    ssh_key => 'AAAAB3NzaC1yc2EAAAADAQABAAABAQCoypusMcT0LZTfvyh7DLC/xTPsOnEYS3JOSwP4PFmN5QnwQGO250kkXDQ6UttxfimJbquvZY2MN3jQbwlTwQIY8xap81v13WjxMIHmN4dYd5GVrIGz6fw7uen3N25r53MIVPjL2UiD9D6RYLPYi9D4VifyjHNvd23lHzNIBAQUBQMMD3x15dStpMQpBgxZKmTkFGtvX1sbpXPHn9JIF4WsCQJshd0KE3NpfzMZIsbjP2NNjujHeKxzbgRjR1U2cP8BWGezBk+ZIbvkAFfzqEuedR5t2tQmCEDmSnc3T+JfRl0qoyZWr9y3rQqroaMF0MvgpdzfX4XfKY4UqczZcQzF',
    key_type => 'ssh-rsa'
  }

  beluga::user {'djotto':
    uid     => 5005,
    groups  => ['webteam'],
    ssh_key => 'AAAAB3NzaC1yc2EAAAADAQABAAABAQCb0oQBfctaYbksZQnZp0MWIGtjJTd4o8tQGM3QJb39w31FiYFmXLo8XNLFnfZU1xr6WH2AeaaGtuPI5feemlzyDF58wHL1OSqETPQVqiSBiAz7WfiRl2Bdztu8yVvAEWWUJNDh9wncToa/dmBoMfq5K518iGoyO79NVU7FpzxCH9lSnL9bLHdC6bKXmuqUZ+lWRkTLVyUO9qt70GY58NohVJC15uUJ2tWA2TPl7PUMRvKL6TPjlosViQ8vBjFzWKO0+key8iWebz4Meu+xWJ9KDuH5ro4hSHOuIOduLARdw8DV6bnvTV4K9zC41dVIromNSj3Zwp0TQxOciC6/cg55',
    key_type => 'ssh-rsa',
  }
  beluga::user {'jenkins':
    uid     => 5006,
    groups  => ['webteam'],
    ssh_key => 'AAAAB3NzaC1yc2EAAAABIwAAAQEAytkn5otUyVKPKuvcb5OAgMiBVdpKRXEBgY3tkdwyw6w75hEmPf2JH19Rp0CSHX5BAfU1vHVaABlvncLe82FWnpdx+qv4VHN7/wDwhFC/hXfkuZ810JV46h1AoqCk7A3pmONqiFvmG+2aQ9GalHYAFAEkKpcxqjdCnpBlWwuQ43wtPQGLEPaYsn43ShO2DnVvMGMqzj8dX1QDkkXmXJXh28dMR0OKCcbqktchLmtlqIuRfXP8gw3/b243+8LWcU/iv5zVmkaEsLulAgOIZUciDviLVDC/tdYsT0S40jQ5Npq9X7/DXvgV/VUGrbODjZsTL91sFZYBXDESCKbMKjQa+Q==',
    key_type => 'ssh-rsa',
  }

}

class beluga_groups {
  group {
    "admins":
    ensure  => present,
    gid     => 7000;
  }
}
