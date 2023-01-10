{ config
, ...
}: {
  security.pam.enableSudoTouchIdAuth = true;
}
