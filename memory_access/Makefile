# SPDX-FileCopyrightText: Copyright (c) 2019 NVIDIA CORPORATION & AFFILIATES. All rights reserved.
# SPDX-License-Identifier: LicenseRef-NvidiaProprietary
#
# NVIDIA CORPORATION, its affiliates and licensors retain all intellectual
# property and proprietary rights in and to this material, related
# documentation and any modifications thereto. Any use, reproduction,
# disclosure or distribution of this material and related documentation
# without an express license agreement from NVIDIA CORPORATION or
# its affiliates is strictly prohibited.

FC = nvfortran
OBJ = o
EXE = out
UNAME := $(shell uname -a)
ifeq ($(findstring _NT, $(UNAME)), _NT)
	OBJ = obj
	EXE = exe
endif

FCFLAGS ?= -O2 -gpu=cc86,deepcopy

# Uncomment the CUDAFLAGS line if you have hardware requirements that
# require a specific compute capability
CUDAFLAGS ?= -Mfree -Mpreprocess -Mbackslash -traceback -acc -fast -Mnoautoinline -cuda -gpu=cc86,deepcopy -Minfo -fPIC -Wall -Kieee

all: build profile

build: maccess.f90
	$(FC) $(FCFLAGS) $(CUDAFLAGS) -o maccess.$(EXE) $<

# run: maccess.$(EXE)
# 	$(RUN) ./maccess.$(EXE)

profile: maccess.$(EXE)
	ncu -o ./profile_report  --force-overwrite --set detailed ./maccess.$(EXE)
	cp profile_report.ncu-rep /mnt/d/MCS/

clean:
	@echo 'Cleaning up...'
	@rm -rf maccess.$(EXE) *.$(OBJ) *.mod *.dwf *.pdb prof
