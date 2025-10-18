//! Evolutionary Particle Lerna

mod particle_sim;

use bevy::prelude::*;
use particle_sim::{
    GainMu, GainSigma, KernelMu, KernelSigma, KernelW, RepulsionMult,
};

fn main() {
    App::new()
        .add_plugins(DefaultPlugins)
        .add_plugins(EPLernaPlugins)
        .run();
}

fn init() {}

/// Main bevy plugin and entrypoint for the EPLerna simulation.
struct EPLernaPlugins;

impl Plugin for EPLernaPlugins {
    fn build(&self, app: &mut App) {
        app.insert_resource(KernelMu::default())
            .insert_resource(KernelSigma::default())
            .insert_resource(KernelW::default())
            .insert_resource(GainMu::default())
            .insert_resource(GainSigma::default())
            .insert_resource(RepulsionMult::default());
    }
}

/// Debug UI plugin for EPLerna.
struct EPLDebugUIPlugin;

impl EPLDebugUIPlugin {
    /// Inserts a resource while tracking it with the debug UI.
    pub(crate) fn insert_tracked_resource(app: &mut App, resource) {
    }

    pub fn ui_init_system() {

    }

}

impl Plugin for EPLDebugUIPlugin {
    fn build(&self, app: &mut App) {
    }
}

