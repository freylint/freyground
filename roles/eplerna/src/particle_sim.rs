//! Particle simulation logic for Evolutionary Particle Lerna (EPLerna).

use bevy::prelude::*;

/// `KernelMu` - Represents the distance of the center of the kernel ring from the origin.
#[derive(Resource, Component, Debug)]
pub struct KernelMu {
    inner: f32,
}

impl KernelMu {
    pub fn new(value: f32) -> Self {
        Self { inner: value }
    }
}

impl Default for KernelMu {
    fn default() -> Self {
        Self { inner: 4.0 }
    }
}

/// `KernelSigma` - Represents the width of the kernel ring.
#[derive(Resource, Component, Debug)]
pub struct KernelSigma {
    inner: f32,
}

impl KernelSigma {
    pub fn new(value: f32) -> Self {
        Self { inner: value }
    }
}

impl Default for KernelSigma {
    fn default() -> Self {
        Self { inner: 1.0 }
    }
}

/// `KernelW` - Represents the strength of the kernel ring.
#[derive(Resource, Component, Debug)]
pub struct KernelW {
    inner: f32,
}

impl KernelW {
    pub fn new(value: f32) -> Self {
        Self { inner: value }
    }
}

impl Default for KernelW {
    fn default() -> Self {
        Self { inner: 0.022 }
    }
}

/// `GainMu` - Represents the distance of the center of the gain peak from the origin.
#[derive(Resource, Component, Debug)]
pub struct GainMu {
    inner: f32,
}

impl GainMu {
    pub fn new(value: f32) -> Self {
        GainMu { inner: value }
    }
}

impl Default for GainMu {
    fn default() -> Self {
        GainMu { inner: 0.6 }
    }
}

/// `GainSigma` - Represents the width of the gain peak.
#[derive(Resource, Component, Debug)]
pub struct GainSigma {
    inner: f32,
}

impl GainSigma {
    pub fn new(value: f32) -> Self {
        GainSigma { inner: value }
    }
}

impl Default for GainSigma {
    fn default() -> Self {
        Self { inner: 0.15 }
    }
}

/// `RepulsionMult` - Multiplier for the repulsion force between particles.
#[derive(Resource, Component, Debug)]
pub struct RepulsionMult {
    inner: f32,
}

impl RepulsionMult {
    pub fn new(value: f32) -> Self {
        Self { inner: value }
    }
}

impl Default for RepulsionMult {
    fn default() -> Self {
        Self { inner: 0.01 }
    }
}

/// `Rfield`
#[derive(Resource, Component, Debug)]
struct RField {
    inner: f32,
}

impl RField {
    pub fn new(value: f32) -> Self {
        Self { inner: value }
    }
}

/// `Ufield`
#[derive(Resource, Component, Debug)]
struct UField {
    inner: f32,
}

impl UField {
    pub fn new(value: f32) -> Self {
        Self { inner: value }
    }
}

/// `RGradient`
#[derive(Resource, Component, Debug)]
struct RGradient {
    inner: f32,
}

impl RGradient {
    pub fn new(value: f32) -> Self {
        Self { inner: value }
    }
}

/// `UGradient`
#[derive(Resource, Component, Debug)]
struct UGradient {
    inner: f32,
}

impl UGradient {
    pub fn new(value: f32) -> Self {
        Self { inner: value }
    }
}

// Gaussian peak function
// TODO ensure this matches the paper
fn gaussian_peak(x: f32, mu: f32, sigma: f32) -> f32 {
    (-((x - mu).powi(2)) / (2.0 * sigma.powi(2))).exp()
}
