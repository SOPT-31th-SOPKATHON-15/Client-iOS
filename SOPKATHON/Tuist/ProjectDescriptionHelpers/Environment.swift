import ProjectDescription

public enum Environment {
    public static let appBundleId = "com.sopkathon.release"
    public static let organizationName = "sopkathon"
    public static let deploymentTarget: DeploymentTarget = .iOS(targetVersion: "14.0", devices: [.iphone, .ipad])
}
