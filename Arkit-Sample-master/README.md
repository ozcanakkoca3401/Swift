# Arkit-Sample
Swift Arkit Application


    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Set the view’s delegate
        sceneView.delegate = self
        // Create a new scene
        let scene = SCNScene()
        let sphere = SCNSphere(radius: 0.3)
        let material = SCNMaterial()
        material.diffuse.contents = UIImage(named: "s2.jpg")
        sphere.materials = [material]
        let sphereNode = SCNNode(geometry: sphere)
        sphereNode.position = SCNVector3(0,0,-0.5)
        scene.rootNode.addChildNode(sphereNode)
        // Set the scene to the view
        sceneView.scene = scene
    }
