wget --timeout=5 https://raw.githubusercontent.com/analogdevicesinc/pyadi-iio/main/.github/scripts/install_libiio.sh -O - | bash
wget --timeout=5 https://raw.githubusercontent.com/analogdevicesinc/pyadi-iio/main/.github/scripts/install_part_libs.sh -O - | bash
wget --timeout=5 https://raw.githubusercontent.com/analogdevicesinc/pyadi-iio/main/.github/scripts/install_iioemu.sh -O - | bash

wget --timeout=5 https://raw.githubusercontent.com/analogdevicesinc/pyadi-iio/main/requirements.txt
wget --timeout=5 https://raw.githubusercontent.com/analogdevicesinc/pyadi-iio/main/requirements_dev.txt
wget --timeout=5 https://raw.githubusercontent.com/analogdevicesinc/pyadi-iio/main/requirements_doc.txt
wget --timeout=5 https://raw.githubusercontent.com/analogdevicesinc/pyadi-iio/main/.github/scripts/install_pydeps.sh -O - | bash