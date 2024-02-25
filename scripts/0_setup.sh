#!/usr/bin/env bash
cd "$(dirname $0)/.."

set -e

mkdir -p .venvs
mkdir -p workspace

is_arm64() {
  [ "$(uname -sm)" == "Darwin arm64" ]
}

if [ ! -d .dfl/DeepFaceLab ]; then
  echo "Cloning DeepFaceLab"
  git clone --no-single-branch --depth 1 "https://github.com/Smiril/DeepFaceLab_Apple-Silicon.git" .dfl/DeepFaceLab

    (cd .dfl/DeepFaceLab; git checkout main)
fi

if [ ! -d .venvs/deepfacelab ]; then
  venv -p python3 ./venvs/deepfacelab
fi

source .venvs/deepfacelab/bin/activate

python3 -m pip install --upgrade pip

version=$(python3 -V | cut -f 2 -d ' ' | cut -f 1,2 -d .)
reqs_file='requirements.txt'

version_suffix=''
if [[ ! -z "$version" && -f "requirements_$version.txt" ]]; then
  version_suffix="_$version"
fi

architecture_suffix=''
if is_arm64 && [ -f "requirements${version_suffix}_arm64.txt" ]; then
  architecture_suffix="_arm64"
fi

reqs_file="requirements${version_suffix}${architecture_suffix}.txt"

echo "Using $reqs_file for $(python3 -V)"

pip --no-cache-dir install -r $reqs_file

echo "Done."
