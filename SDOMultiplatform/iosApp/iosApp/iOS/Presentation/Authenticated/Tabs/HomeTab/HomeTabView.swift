//
//  HomeTabView.swift
//  SDO (iOS)
//
//  Created by Joel Kingsley on 09/04/2022.
//

import SwiftUI
import ComposeApp

struct HomeTabView: View {
    @EnvironmentObject var authViewModel: AuthenticationViewModel
    @ObservedObject var homeTabViewModel = HomeTabViewModel()
    @Binding var path: NavigationPath
    
    var body: some View {
        if let homeScreenData = homeTabViewModel.homeScreenData {
            switch homeScreenData {
            case let .success(data):
                VStack {
                    ScrollView(.vertical, showsIndicators: false) {
                        VStack {
                            if !data.documentaries.isEmpty {
                                HomeVideosRow(
                                    title: "homeDocumentariesLabel",
                                    videoThumbnailStyle: .small,
                                    videos: data.documentaries,
                                    showAllItemType: .documentaries,
                                    path: $path
                                )
                            }
                            if !data.sermons.isEmpty {
                                HomeVideosRow(
                                    title: "homeSermonsLabel",
                                    videoThumbnailStyle: .small,
                                    videos: data.sermons,
                                    showAllItemType: .sermons,
                                    path: $path
                                )
                            }
                            if !data.shorts.isEmpty {
                                HomeVideosRow(
                                    title: "homeShortsLabel",
                                    videoThumbnailStyle: .small,
                                    videos: data.shorts,
                                    showAllItemType: .shorts,
                                    path: $path
                                )
                            }
                            if !data.musicVideos.isEmpty {
                                HomeVideosRow(
                                    title: "homeMusicLabel",
                                    videoThumbnailStyle: .small,
                                    videos: data.musicVideos,
                                    showAllItemType: .music,
                                    path: $path
                                )
                            }
                            if !data.interviews.isEmpty {
                                HomeVideosRow(
                                    title: "homeInterviewsLabel",
                                    videoThumbnailStyle: .small,
                                    videos: data.interviews,
                                    showAllItemType: .interviews,
                                    path: $path
                                )
                            }
                        }
                    }
                    .refreshable {
                        await homeTabViewModel.onRefresh(user: authViewModel.getUser())
                    }
                }
                .edgesIgnoringSafeArea(.horizontal)
                .navigationBarTitle(Text("homeScreenTitle", comment: "Label: Navigation bar title of Home Screen"))
                .navigationDestination(for: HomeScreenData.HomeVideo.self) { video in
                    VideoDetailView(
                        videoId: video.videoId,
                        channelId: video.channelId,
                        path: $path
                    )
                }
                .navigationDestination(for: SearchResultItemType.self, destination: { itemType in
                    SearchResultView(ofItemType: itemType, language: LanguageData.Companion().invoke(), path: $path)
                })
            case let .failure(error):
                CustomErrorView(
                    error: error,
                    authViewModel: authViewModel) {
                        homeTabViewModel.onLoaded(user: authViewModel.getUser())
                    }
            }
        } else {
            ProgressView("progressViewLoadingLabel")
                .progressViewStyle(.circular)
                .onAppear {
                    homeTabViewModel.onLoaded(user: authViewModel.getUser())
                }
        }
    }
}

struct HomeTabView_Previews: PreviewProvider {
    static var previews: some View {
        HomeTabView(path: Binding.constant(NavigationPath()))
    }
}
