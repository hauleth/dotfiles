{ ... }: {
  programs.direnv = {
    enable = true;

    nix-direnv.enable = true;

    stdlib = ''
      layout_postgres() {
          export PGDATA="$(direnv_layout_dir)/postgres"
          export PGHOST="$PGDATA"

          if [[ ! -d "$PGDATA" ]]; then
              initdb -U postgres
              cat >> "$PGDATA/postgresql.conf" <<-EOF
                              listen_addresses = '''
                              unix_socket_directories = '$PGHOST'
      EOF
              echo "CREATE DATABASE $USER;" | postgres --single -E postgres
          fi
      }
    '';
  };
}
