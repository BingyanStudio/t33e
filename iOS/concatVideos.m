/*
concat videos and save to saveURL
must save the AVURLAsset in a array
 */
- (void)concatVideos:(NSArray<NSURL *> *)videos saveTo:(NSURL *)saveURL completion:(void(^)(NSError *))completion {
    // overwrite file
    NSError *error;
    [self removeFileAt:saveURL error:&error];
    
    // arrays
    NSMutableArray<AVURLAsset *> *assets = [[NSMutableArray alloc] init];
    NSMutableArray<NSValue *> *timeRanges = [[NSMutableArray alloc] init];
    NSMutableArray<AVAssetTrack *> *tracks = [[NSMutableArray alloc] init];
    
    for (NSURL *url in videos) {
        [assets addObject:[AVURLAsset assetWithURL:url]]; // 坑 必须要保存下AVURLAsset
        [timeRanges addObject:[NSValue valueWithCMTimeRange:[self timeRangeOfAVAsset:[assets lastObject]]]];
        [tracks addObject:[[[assets lastObject] tracksWithMediaType:AVMediaTypeVideo] firstObject]];
    }
    
    // output
    AVMutableComposition *composition = [AVMutableComposition composition];
    AVMutableCompositionTrack *compositionTrack = [composition addMutableTrackWithMediaType:AVMediaTypeVideo preferredTrackID:kCMPersistentTrackID_Invalid];
    [compositionTrack insertTimeRanges:timeRanges ofTracks:tracks atTime:kCMTimeZero error:&error];
    
    // export
    AVAssetExportSession *exporter = [[AVAssetExportSession alloc] initWithAsset:composition presetName:AVAssetExportPresetHighestQuality];
    if (self.saveFileType) {
        exporter.outputFileType = self.saveFileType;
    } else {
        exporter.outputFileType = AVFileTypeMPEG4;
    }
    exporter.outputURL = saveURL;
    [exporter exportAsynchronouslyWithCompletionHandler:^{
        completion(exporter.error);
    }];
}
