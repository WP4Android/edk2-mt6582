[Defines]
  PLATFORM_NAME                  = S3030Pkg
  PLATFORM_GUID                  = 28f1a3bf-193a-47e3-a7b9-5a435eaab2ee
  PLATFORM_VERSION               = 0.1
  DSC_SPECIFICATION              = 0x00010019
  OUTPUT_DIRECTORY               = Build/$(PLATFORM_NAME)
  SUPPORTED_ARCHITECTURES        = ARM
  BUILD_TARGETS                  = DEBUG|RELEASE
  SKUID_IDENTIFIER               = DEFAULT
  FLASH_DEFINITION               = S3030Pkg/S3030Pkg.fdf


################################################################################
#
# Pcd Section - list of all EDK II PCD Entries defined by this Platform
#
################################################################################

[PcdsFeatureFlag.common]
  ## If TRUE, Graphics Output Protocol will be installed on virtual handle created by ConsplitterDxe.
  #  It could be set FALSE to save size.
  gEfiMdeModulePkgTokenSpaceGuid.PcdConOutGopSupport|TRUE
  gEfiMdeModulePkgTokenSpaceGuid.PcdConOutUgaSupport|FALSE


[PcdsFixedAtBuild.common]
  gEfiMdePkgTokenSpaceGuid.PcdDefaultTerminalType|4

  gEfiMdeModulePkgTokenSpaceGuid.PcdFirmwareVersionString|L"Alpha"

  # System Memory (512MB)
  gArmTokenSpaceGuid.PcdSystemMemoryBase|0x80000000
  gArmTokenSpaceGuid.PcdSystemMemorySize|0xE0000000

  # We only boot one processor here!
  gArmPlatformTokenSpaceGuid.PcdCoreCount|1
  gArmPlatformTokenSpaceGuid.PcdClusterCount|1

  
  !if $(TARGET) == RELEASE
  gEfiMdePkgTokenSpaceGuid.PcdDebugPropertyMask|0x0e
!else
  gEfiMdePkgTokenSpaceGuid.PcdDebugPropertyMask|0x0f
!endif
  #
  # ARM PrimeCell
  #

  #
  # ARM General Interrupt Controller
  #
  gArmTokenSpaceGuid.PcdGicDistributorBase|0x17a00000
  gArmTokenSpaceGuid.PcdGicRedistributorsBase|0x17b00000

  gArmTokenSpaceGuid.PcdArmArchTimerIntrNum|0x12
  gArmTokenSpaceGuid.PcdArmArchTimerVirtIntrNum|0x13

  #
  #
  # Fastboot
  #
  gEmbeddedTokenSpaceGuid.PcdAndroidFastbootUsbVendorId|0x18d1
  gEmbeddedTokenSpaceGuid.PcdAndroidFastbootUsbProductId|0xd00d

  #
  # Make VariableRuntimeDxe work at emulated non-volatile variable mode.
  #
  gEfiMdeModulePkgTokenSpaceGuid.PcdEmuVariableNvModeEnable|TRUE

  gS3030PkgTokenSpaceGuid.PcdMipiFrameBufferAddress|0x9d400000
  gS3030PkgTokenSpaceGuid.PcdMipiFrameBufferWidth|480
  gS3030PkgTokenSpaceGuid.PcdMipiFrameBufferHeight|800

  gEfiMdeModulePkgTokenSpaceGuid.PcdAcpiExposedTableVersions|0x20

################################################################################
#
# Components Section - list of all EDK II Modules needed by this Platform
#
################################################################################
[Components.common]
  MdePkg\Library\BasePrintLib\BasePrintLib.inf
  MdePkg\Library\BasePeCoffLib\BasePeCoffLib.inf
  MdePkg\Library\BaseUefiDecompressLib\BaseUefiDecompressLib.inf
  EmbeddedPkg\Library\PrePiLib\PrePiLib.inf
  MdePkg\Library\BaseMemoryLib\BaseMemoryLib.inf
  MdeModulePkg\Library\PeiPerformanceLib\PeiPerformanceLib.inf
  MdePkg\Library\BaseIoLibIntrinsic\IoLibArm.inf
  ArmPkg\Library\ArmLib\ArmV7\ArmV7Mmu.inf
  MdePkg\Library\BaseLib\SwitchStack.inf
  MdePkg\Library\BaseLib\RShiftU64.inf
  MdePkg\Library\BaseLib\DivU64x32Remainder.inf
  MdePkg\Library\BaseLib\String.inf
  MdePkg\Library\BaseLib\Arm\Unaligned.inf
  EmbeddedPkg\Library\PrePiExtractGuidedSectionLib\PrePiExtractGuidedSectionLib.inf
  IntelFrameworkModulePkg\Library\LzmaCustomDecompressLib\LzmaDecompress.inf
  IntelFrameworkModulePkg\Library\LzmaCustomDecompressLib\GuidedSectionExtraction.inf
  EmbeddedPkg\Library\PrePiMemoryAllocationLib\MemoryAllocationLib.inf
  S3030Pkg/Drivers/LogoDxe/LogoDxe.inf
