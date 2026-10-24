{ config, pkgs, ...}:

{
  home.sessionVariables = {
    BROWSER = "firefox";
  };

  programs.firefox = {
    enable = true;

    policies = {
      # privacy & security
      DisableFirefoxStudies = true;
      DisablePocket = true;
      DisableTelemetry = true;
      HttpsOnlyMode = "enabled";

      # ui
      DisplayBookmarksToolbar = "always";
      DisplayMenuBar = "default-off";

      # behaviour
      AutofillCreditCardEnabled = false;
      AutofillAddressEnabled = false;
      OfferToSaveLogins = false;
      PasswordManagerEnabled = false;
      TranslateEnabled = false;

      DownloadDirectory = "/tmp/firefox-downloads";
      PromptForDownloadLocation = true;

      # extensions
      ExtensionSettings = let
        moz = short: "https://addons.mozilla.org/firefox/downloads/latest/${short}/latest.xpi";
      in {
        "uBlock0@raymondhill.net" = {
          installation_mode = "force_installed";
          updates_disabled = true;

          default_area = "navbar";
          private_browsing = true;
        };

        "sponsorBlocker@ajay.app" = {
          installation_mode = "force_installed";
          updates_disabled = true;

          default_area = "menupanel";
          private_browsing = true;
        };

        "addon@darkreader.org" = {
          installation_mode = "force_installed";
          updates_disabled = true;

          default_area = "navbar";
          private_browsing = true;
        };

        "extension@tabliss.io" = {
          installation_mode = "force_installed";
          updates_disabled = true;

          default_area = "menupanel";
          private_browsing = false;
        };

        # adaptive tab bar color
        "ATBC@EasonWong" = {
          installation_mode = "force_installed";
          updates_disabled = true;

          default_area = "menupanel";
          private_browsing = true;
        };
      };

      # Extension configuration
      "3rdparty".Extensions = {
        "uBlock0@raymondhill.net".toOverwrite = {
          filterLists = [
            # ads
            "DEU-0"
            "easylist"
            "plowe-0"
            "ublock-filters"
            "ublock-abuse"
            "ublock-quick-fixes"
            "ublock-unbreak"

            # annoyances
            "fanboy-cookiemonster"
            "ublock-cookies-easylist"
            "ublock-annoyances"
            "https://raw.githubusercontent.com/gijsdev/ublock-hide-yt-shorts/master/list.txt"

            # privacy & security
            "urlhaus-1"
            "easyprivacy"
            "ublock-badware"
            "ublock-privacy"
          ];
        };
      };
    };

    profiles."simikir" = {
      settings = {
        "browser.tabs.closeWindowWithLastTab" = false;
        "browser.tabs.insertAfterCurrent" = true;

        "services.sync.engine" = {
          "addresses" = false;
          "bokmarks" = true;
          "creditcards" = false;
          "history" = true;
          "passwords" = false;
          "prefs" = false;
          "prefs.modified" = false;
          "tabs" = false;
        };
      };

      search = {
        force           = true;
        default         = "Google";
        privateDefault  = "Google";

        engines = {
          "Nix Packages" = {
            urls = [
              {
                template = "https://search.nixos.org/packages";
                params = [
                  { name = "channel"; value = "unstable"; }
                  { name = "query";   value = "{searchTerms}"; }
                ];
              }
            ];
            # icon           = "${pkgs.nixos-icons}/share/icons/hicolor/scalable/apps/nix-snowflake.svg";
            definedAliases = [ "@np" ];
          };

          "Nix Options" = {
            urls = [
              {
                template = "https://search.nixos.org/options";
                params = [
                  { name = "channel"; value = "unstable"; }
                  { name = "query";   value = "{searchTerms}"; }
                ];
              }
            ];
            # icon           = "${pkgs.nixos-icons}/share/icons/hicolor/scalable/apps/nix-snowflake.svg";
            definedAliases = [ "@no" ];
          };
        };
      };
    };
  };
}
