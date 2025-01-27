#pragma once

#include <lvgl/lvgl.h>
#include <cstdint>
#include <memory>
#include <array>
#include "Screen.h"
#include "../Apps.h"
#include "components/settings/Settings.h"

namespace Pinetime {
  namespace Applications {
    namespace Screens {
      class Tile : public Screen {
        public:
          struct Applications {
            const char* icon;
            Pinetime::Applications::Apps application;
          };

          explicit Tile(uint8_t screenID, DisplayApp* app, Controllers::Settings& settingsController, std::array<Applications, 6>& applications);
          ~Tile() override;

          bool Refresh() override;
          bool OnButtonPushed() override;

          void OnObjectEvent(lv_obj_t* obj, lv_event_t event, uint32_t buttonId);

        private:
          lv_obj_t * btnm1;
          bool running = true;

          const char* btnm_map1[8];
          Pinetime::Applications::Apps apps[6];
      };
    }
  }
}
