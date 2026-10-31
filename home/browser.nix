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

      # search engines
      SearchEngines = {
        Default = "Google";

        Add = [
          {
            Name = "Nix Packages";
            URLTemplate = "https://search.nixos.org/packages?channel=unstable&query={searchTerms}";
            IconURL = "https://brand.nixos.org/logos/nixos-logomark-rainbow-gradient-recommended.svg";
            Alias = "np";
          }

          {
            Name = "Nix Options";
            URLTemplate = "https://search.nixos.org/options?channel=unstable&query={searchTerms}";
            IconURL = "https://brand.nixos.org/logos/nixos-logomark-rainbow-gradient-recommended.svg";
            Alias = "no";
          }
        ];

        Remove = [ "Bing" "Startpage" ];
      };

      # extensions
      ExtensionSettings = {
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

    # preferences
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
    };
  };
}
