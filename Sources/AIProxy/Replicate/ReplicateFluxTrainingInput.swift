//
//  ReplicateFluxTrainingInput.swift
//
//
//  Created by Lou Zell on 9/8/24.
//

import Foundation

public struct ReplicateFluxTrainingInput: Encodable {

    // Required

    /// A zip file containing the images that will be used for training. We recommend a minimum
    /// of 10 images. If you include captions, include them as one .txt file per image, e.g.
    /// my-photo.jpg should have a caption file named my-photo.txt. If you don't include
    /// captions, you can use autocaptioning (enabled by default).
    public let inputImages: URL // Zip file

    // Optional

    /// Automatically caption images using Llava v1.5 13B
    public let autocaption: Bool?

    /// Text you want to appear at the beginning of all your generated captions; for example,
    /// ‘a photo of TOK, ’. You can include your trigger word in the prefix. Prefixes help set
    /// the right context for your captions, and the captioner will use this prefix as context.
    public let autocaptionPrefix: String?

    /// Text you want to appear at the end of all your generated captions; for example, ‘ in
    /// the style of TOK’. You can include your trigger word in suffixes. Suffixes help set the
    /// right concept for your captions, and the captioner will use this suffix as context.
    public let autocaptionSuffix: String?

    /// Regular expression to match specific layers to optimize. Optimizing fewer layers
    /// results in shorter training times, but can also result in a weaker LoRA. For example,
    /// To target layers 7, 12, 16, 20 which seems to create good likeness with faster training
    /// (as discovered by lux in the Ostris discord, inspired by The Last Ben), use
    /// `transformer.single_transformer_blocks.(7|12|16|20).proj_out`.
    public let layersToOptimizeRegex: String?

    /// Learning rate, if you’re new to training you probably don’t need to change this.
    /// Default: 0.0004
    public let learningRate: Double?

    /// Higher ranks take longer to train but can capture more complex features. Caption
    /// quality is more important for higher ranks.
    /// Deafult: 16
    public let loraRank: Int?

    /// Number of training steps. Recommended range 500-4000
    ///
    /// (minimum: 3, maximum: 6000)
    /// Default: 1000
    public let steps: Int?

    /// The trigger word refers to the object, style or concept you are training on. Pick a
    /// string that isn’t a real word, like TOK or something related to what’s being trained,
    /// like CYBRPNK. The trigger word you specify here will be associated with all images
    /// during training. Then when you use your LoRA, you can include the trigger word in
    /// prompts to help activate the LoRA.
    public let triggerWord: String?

    private enum CodingKeys: String, CodingKey {
        case inputImages = "input_images"
        case autocaption
        case autocaptionPrefix = "autocaption_prefix"
        case autocaptionSuffix = "autocaption_suffix"
        case layersToOptimizeRegex = "layers_to_optimize_regex"
        case learningRate = "learning_rate"
        case loraRank = "lora_rank"
        case steps
        case triggerWord = "trigger_word"
    }

    // This memberwise initializer is autogenerated.
    // To regenerate, use `cmd-shift-a` > Generate Memberwise Initializer
    // To format, place the cursor in the initializer's parameter list and use `ctrl-m`
    public init(
        inputImages: URL,
        autocaption: Bool? = nil,
        autocaptionPrefix: String? = nil,
        autocaptionSuffix: String? = nil,
        layersToOptimizeRegex: String? = nil,
        learningRate: Double? = nil,
        loraRank: Int? = nil,
        steps: Int? = nil,
        triggerWord: String? = nil
    ) {
        self.inputImages = inputImages
        self.autocaption = autocaption
        self.autocaptionPrefix = autocaptionPrefix
        self.autocaptionSuffix = autocaptionSuffix
        self.layersToOptimizeRegex = layersToOptimizeRegex
        self.learningRate = learningRate
        self.loraRank = loraRank
        self.steps = steps
        self.triggerWord = triggerWord
    }
}