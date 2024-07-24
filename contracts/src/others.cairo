#[dojo::contract]
mod others {
    use starknet::{ContractAddress, ClassHash, get_caller_address};
    use craft_island::models::{Position, Moves, Direction, Vec2};
    use craft_island::utils::next_position;

    #[derive(Copy, Drop, Serde)]
    #[dojo::event]
    #[dojo::model]
    struct ContractInitialized {
        #[key]
        contract_address: ContractAddress,
        contract_class: ClassHash,
        value: u8,
    }


    fn dojo_init(
        world: @IWorldDispatcher,
        actions_address: ContractAddress,
        actions_class: ClassHash,
        value: u8
    ) {
        emit!(
            world,
            ContractInitialized {
                contract_address: actions_address, contract_class: actions_class, value
            }
        );
    }
}
