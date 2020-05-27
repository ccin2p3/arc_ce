define arc_ce::authgroup(
  Array[Arc_ce::AuthgroupRule] $rules = [],
) {
  concat::fragment { "arc.conf_authgroup_${name}":
    target  => '/etc/arc.conf',
    content => template("${module_name}/authgroup.erb"),
    order   => 02,
  }
}
