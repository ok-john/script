defaults write com.apple.AdLib adprivacydMaxSegmentSendInterval -int 21473000000
defaults write com.apple.AdLib adprivacydSegmentInterval -int 2147000000
defaults write com.apple.AdLib allowApplePersonalizedAdvertising -int 0
defaults write com.apple.AdLib allowIdentifierForAdvertising -int 0
defaults write com.apple.AdLib personalizedAdsMigrated -int 1
defaults write com.apple.AdPlatforms AppStorePAAvailable -int 0
defaults write com.apple.AdPlatforms LatestPAVersion -1 1
defaults delete com.apple.CallHistorySyncHelper
defaults delete com.apple.CharacterPaletteIM
defaults delete com.apple.Classroom-Settings.extension
defaults delete com.apple.CloudSubscriptionFeatures.config
defaults delete com.apple.CommCenter.counts
defaults delete com.apple.DiagnosticExtensions.extensionTracker
defaults delete com.apple.DictionaryServices
defaults delete com.apple.EmojiCache
defaults delete com.apple.EmojiPreferences
defaults delete com.apple.EscrowSecurityAlert
defaults delete com.apple.MobileSMS
defaults delete com.apple.Music
defaults delete com.apple.ReportCrash
defaults write com.apple.ScreenTimeAgent GenesisCloudMirroringImportOccurred -int 0
defaults delete com.apple.ServicesMenu.Services
defaults delete com.apple.Siri-Settings.extension
defaults delete com.apple.SpeakSelection
defaults delete com.apple.StatusKitAgent
defaults delete com.apple.TV
defaults delete com.apple.TelephonyUtilities
defaults delete com.apple.TelephonyUtilities.sharePlayAppPolicies
defaults delete com.apple.accountsd
defaults delete com.apple.amp.mediasharingd
defaults delete com.apple.amsengagementd
defaults delete com.apple.animoji
defaults delete com.apple.appleaccountd
defaults delete com.apple.appstored
defaults write com.apple.assistant "MultiUserSharedDataNeedsSync" -int 0
defaults write com.apple.assistant "VoiceTriggerNeedsSync" -int 0
defaults delete com.apple.assistant.support
defaults delete com.apple.assistantd
defaults delete com.apple.biomesyncd
defaults delete com.apple.bluetoothuserd
defaults delete com.apple.calaccessd
defaults delete com.apple.calculateframework
defaults delete com.apple.calculator
defaults delete com.apple.classroom
defaults delete com.apple.cloudpaird
defaults delete com.apple.cloudphotod
defaults delete com.apple.commcenter
defaults delete com.apple.commcenter.data
defaults delete com.apple.contacts.donation-agent
